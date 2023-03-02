import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/search_provider.dart';
import 'package:fabrikod_quran/screens/home_screen.dart';
import 'package:fabrikod_quran/screens/surah_details/reading_screen.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:fabrikod_quran/screens/surah_details/translation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class SurahDetailsProvider extends ChangeNotifier {
  /// Class Constructor
  SurahDetailsProvider(
      this._context, this.readingSettings, EQuranType quranType) {
    quranProvider.changeQuranType(quranType.index);
    getDisplayedSurahs();
    getDisplayedVerses();
    getMushafPageList();
  }

  /// Detail Screen Context
  final BuildContext _context;

  /// Reading settings model
  late ReadingSettingsModel readingSettings;

  /// [bool] checking if settings is opened in [SurahDetailsScreen]
  bool isOpenSetting = false;

  /// [bool] checking if title page is opened in [SurahDetailsScreen]
  bool isTitleMenu = false;

  /// Surah Details page - juz and surah toggle buttons
  EJuzSurahToggleOptions juzSurahToggleOptionType = EJuzSurahToggleOptions.juz;

  /// Juz List Type [EJuzListType]
  EJuzListType juzListType = EJuzListType.list;

  /// Get [QuranProvider]
  QuranProvider get quranProvider => _context.read<QuranProvider>();

  /// Get [AppSettingsProvider]
  AppSettingsProvider get appSettingsProvider =>
      _context.read<AppSettingsProvider>();

  /// List of surahs which are displayed in the [SurahDetailsScreen] in [TranslationScreen]
  List<SurahModel> displayedSurahs = [];

  /// List of verses which are displayed in the [SurahDetailsScreen] in [TranslationScreen]
  List<VerseModel> displayedVerses = [];

  /// List of verses which are displayed in the [SurahDetailsScreen] in [ReadingScreen]
  List<List<SurahModel>> mushafPageList = [];

  /// Change Quran Screen Setting Mode
  void changeOpenSetting() {
    isOpenSetting = !isOpenSetting;
    notifyListeners();
  }

  /// Change Quran Screen Setting Mode
  void changeTitleMenuState() {
    isTitleMenu = !isTitleMenu;
    notifyListeners();
    changeToggleSearchOptions(EToggleSearchOptions.toggles);
  }

  /// Navigation to the specific verse
  int get jumpToVerseIndex {
    int value = displayedVerses.indexWhere((element) {
      return element.surahId == readingSettings.surahId &&
          element.verseNumber == readingSettings.verseId;
    });
    return value == -1 ? 0 : value;
  }

  /// Navigation to the specific page
  int get jumpToMushafPageListIndex {
    int value = mushafPageList.indexWhere((element) {
      return element.first.verses.first.pageNumber ==
          readingSettings.mushafPageNumber;
    });
    return value == -1 ? 0 : value;
  }

  /// Filters surahs which are going to be displayed in the page
  void getDisplayedSurahs() {
    displayedSurahs = [];
    switch (quranProvider.localSetting.quranType) {
      case EQuranType.translation:
        switch (readingSettings.surahDetailScreenMode) {
          case ESurahDetailScreenMode.surah:
            displayedSurahs
                .add(quranProvider.surahs[readingSettings.surahIndex]);
            break;
          case ESurahDetailScreenMode.juz:
            List<SurahModel> list = [];
            for (var element in quranProvider.surahs) {
              var surah = element.juzSurahs(readingSettings.juzId);
              if (surah != null) list.add(surah);
            }
            displayedSurahs = list;
        }
        break;
      case EQuranType.reading:
        for (var surah in quranProvider.surahs) {
          for (var verse in surah.verses) {
            if (verse.pageNumber == readingSettings.mushafPageNumber) {
              displayedSurahs.add(quranProvider.surahs[verse.surahId! - 1]);
              return;
            }
          }
        }
    }
  }

  /// Filters verses which are going to be displayed in the page
  void getDisplayedVerses() {
    List<VerseModel> verses = [];
    for (var element in displayedSurahs) {
      verses = verses + element.verses;
    }
    displayedVerses = verses;
  }

  /// Filters verses which are going to be displayed in the mushaf page
  void getMushafPageList() {
    List<List<SurahModel>> list = [];
    int pageNo = displayedVerses.first.pageNumber!;
    list.add(getSurahOfMushafPage(pageNo));
    for (var verse in displayedVerses) {
      if (verse.pageNumber != pageNo) {
        pageNo = verse.pageNumber!;
        list.add(getSurahOfMushafPage(pageNo));
      }
    }
    mushafPageList = list;
  }

  /// Filters surahs which are going to be displayed in mushaf page
  List<SurahModel> getSurahOfMushafPage(int pageNo) {
    List<SurahModel> list = [];
    for (var surah in displayedSurahs) {
      var newSurah = surah.surahOfMushafPage(pageNo);
      if (newSurah != null) list.add(newSurah);
    }
    return list;
  }

  /// Listens for the scroll list of the surah details screen
  /// Declares scroll position when it stops on specific surah and ayat
  listenToTranslationScreenList(int index) {
    var verse = displayedVerses[index];
    if (verse.verseNumber == readingSettings.verseId &&
        verse.surahId == readingSettings.surahId) {
      return;
    }
    readingSettings.surahId = verse.surahId ?? 1;
    readingSettings.verseId = verse.verseNumber ?? 1;
    notifyListeners();
  }

  /// Listens for the scroll position of the surah details screen mushaf page
  /// Declares scroll position when it stops on specific surah and ayat
  listenToReadingScreenList(int index) {
    var pageNumber = mushafPageList[index].first.verses.first.pageNumber;
    if (pageNumber == readingSettings.mushafPageNumber) {
      return;
    }
    readingSettings.mushafPageNumber = pageNumber ?? 1;
    notifyListeners();
  }

  /// [SurahDetailsScreen] app bar title
  String get appBarTitle {
    switch (quranProvider.localSetting.quranType) {
      case EQuranType.translation:
        return quranProvider.surahs[readingSettings.surahIndex].nameSimple ??
            "";
      case EQuranType.reading:
        var index = displayedVerses.indexWhere((element) =>
            element.pageNumber == readingSettings.mushafPageNumber);
        if (index == -1) return "";
        return quranProvider
                .surahs[displayedVerses[index].surahId! - 1].nameSimple ??
            "";
    }
  }

  /// [SurahDetailsScreen] app bar description
  String get appBarDescription {
    VerseModel verse;
    switch (quranProvider.localSetting.quranType) {
      case EQuranType.translation:
        verse = quranProvider.surahs[readingSettings.surahIndex]
            .verses[readingSettings.verseIndex];
        break;
      case EQuranType.reading:
        var index = displayedVerses.indexWhere((element) =>
            element.pageNumber == readingSettings.mushafPageNumber);
        if (index == -1) return "";
        verse = displayedVerses[index];
    }
    return "${_context.translate.juz} ${verse.juzNumber} | ${_context.translate.hizb} ${verse.hizbNumber} - ${_context.translate.page} ${verse.pageNumber}";
  }

  /// Play or Pause The Verses
  void onTapVerseCardPlayOrPause(int index, bool isPlaying, String verseKey) {
    _context
        .read<PlayerProvider>()
        .onTapPlayOrPause(index, isPlaying, displayedVerses);
  }

  /// Play The Mushaf Page
  void playTheMushafPage(bool isPlaying, int surahId) {
    var index = displayedSurahs.indexWhere((element) => element.id == surahId);
    List<VerseModel> selectedVerses =
        index == -1 ? [] : displayedSurahs[index].verses;
    _context
        .read<PlayerProvider>()
        .onTapPlayOrPause(0, isPlaying, selectedVerses);
  }

  /// Changing reading style in the home page
  /// EX: [Translation] or [Reading]
  void changeQuranType(int index) {
    quranProvider.localSetting.quranType = EQuranType.values.elementAt(index);
    switch (quranProvider.localSetting.quranType) {
      case EQuranType.translation:
        int index = displayedVerses.indexWhere((element) =>
            element.pageNumber == readingSettings.mushafPageNumber);
        if (index != -1) {
          readingSettings.surahId = displayedVerses[index].surahId ?? 1;
          readingSettings.verseId = displayedVerses[index].verseNumber ?? 1;
        }
        break;
      case EQuranType.reading:
        readingSettings.mushafPageNumber = quranProvider
            .surahs[readingSettings.surahIndex]
            .verses[readingSettings.verseIndex]
            .pageNumber!;
    }
    notifyListeners();
  }

  /// Changing reading mode
  void changeReadingMode() {
    readingSettings.isReadingMode = !readingSettings.isReadingMode;
    notifyListeners();
  }

  /// Change type juz, surah or search
  changeJuzOrSurahToggleOptionType(EJuzSurahToggleOptions newOptionType) {
    juzSurahToggleOptionType = newOptionType;
    notifyListeners();
  }

  /// Change list type in [HomeScreen]
  /// Grid view or list view
  changeJuzListType(EJuzListType newListType) {
    juzListType = newListType;
    notifyListeners();
  }

  /// Changing between toggle buttons and search bar
  changeToggleSearchOptions(EToggleSearchOptions newOptionType) {
    _context.read<SearchProvider>().toggleSearchOptions = newOptionType;
    notifyListeners();
  }

  /// Share verse
  Future shareVerse(VerseModel verseModel, int index) async {
    String verseText = verseModel.text!;
    if (_context.read<QuranProvider>().localSetting.readOptions ==
        EReadOptions.translation) {
      verseText = _context
          .read<QuranProvider>()
          .translationService
          .translationsOfVerse(verseModel.id!)[index]
          .text!;
    } else if (_context.read<QuranProvider>().localSetting.readOptions ==
        EReadOptions.surahAndTranslation) {
      verseText =
          "${verseModel.text!}\n${_context.read<QuranProvider>().translationService.translationsOfVerse(verseModel.id!)[index].text!}";
    }
    await Share.share(verseText);
  }
}
