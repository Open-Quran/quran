import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/search_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurahDetailsProvider extends ChangeNotifier {
  /// Detail Screen Context
  final BuildContext _context;

  /// Reading settings model
  late ReadingSettingsModel readingSettings;

  /// is Quran Screen Setting open
  bool isOpenSetting = false;

  /// is Quran Screen Title Menu open
  bool isTitleMenu = false;

  /// Surah Details page - juz and surah toggle buttons
  EJuzSurahToggleOptions juzSurahToggleOptionType = EJuzSurahToggleOptions.juz;

  /// Juz List Type [EJuzListType]
  EJuzListType juzListType = EJuzListType.list;

  /// Get [QuranProvider]
  QuranProvider get quranProvider => _context.read<QuranProvider>();

  /// Get [AppSettingsProvider]
  AppSettingsProvider get appSettingsProvider => _context.read<AppSettingsProvider>();

  /// Class Constructor
  SurahDetailsProvider(this._context, this.readingSettings, EQuranType quranType) {
    quranProvider.changeQuranType(quranType.index);
    getShowedSurahs();
    getShowedVerses();
    getMushafPageList();
  }

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

  List<SurahModel> showedSurahs = [];

  List<VerseModel> showedVerses = [];

  List<List<SurahModel>> mushafPageList = [];

  int get jumpToVerseIndex {
    int value = showedVerses.indexWhere((element) {
      return element.surahId == readingSettings.surahId &&
          element.verseNumber == readingSettings.verseId;
    });
    return value == -1 ? 0 : value;
  }

  int get jumpToMushafPageListIndex {
    int value = mushafPageList.indexWhere((element) {
      return element.first.verses.first.pageNumber == readingSettings.mushafPageNumber;
    });
    return value == -1 ? 0 : value;
  }

  void getShowedSurahs() {
    showedSurahs = [];
    switch (quranProvider.localSetting.quranType) {
      case EQuranType.translation:
        switch (readingSettings.surahDetailScreenMod) {
          case ESurahDetailScreenMod.surah:
            showedSurahs.add(quranProvider.surahs[readingSettings.surahIndex]);
            break;
          case ESurahDetailScreenMod.juz:
            List<SurahModel> list = [];
            for (var element in quranProvider.surahs) {
              var surah = element.juzSurahs(readingSettings.juzId);
              if (surah != null) list.add(surah);
            }
            showedSurahs = list;
        }
        break;
      case EQuranType.reading:
        for (var surah in quranProvider.surahs) {
          for (var verse in surah.verses) {
            if (verse.pageNumber == readingSettings.mushafPageNumber) {
              showedSurahs.add(quranProvider.surahs[verse.surahId! - 1]);
              return;
            }
          }
        }
    }
  }

  void getShowedVerses() {
    List<VerseModel> verses = [];
    for (var element in showedSurahs) {
      verses = verses + element.verses;
    }
    showedVerses = verses;
  }

  void getMushafPageList() {
    List<List<SurahModel>> list = [];
    int pageNo = showedVerses.first.pageNumber!;
    list.add(getSurahOfMushafPage(pageNo));
    for (var verse in showedVerses) {
      if (verse.pageNumber != pageNo) {
        pageNo = verse.pageNumber!;
        list.add(getSurahOfMushafPage(pageNo));
      }
    }
    mushafPageList = list;
  }

  List<SurahModel> getSurahOfMushafPage(int pageNo) {
    List<SurahModel> list = [];
    for (var surah in showedSurahs) {
      var newSurah = surah.surahOfMushafPage(pageNo);
      if (newSurah != null) list.add(newSurah);
    }
    return list;
  }

  listenToTranslationScreenList(int index) {
    var verse = showedVerses[index];
    if (verse.verseNumber == readingSettings.verseId && verse.surahId == readingSettings.surahId) {
      return;
    }
    readingSettings.surahId = verse.surahId ?? 1;
    readingSettings.verseId = verse.verseNumber ?? 1;
    notifyListeners();
  }

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
        return quranProvider.surahs[readingSettings.surahIndex].nameSimple ?? "";
      case EQuranType.reading:
        return mushafPageList.first.first.nameSimple ?? "";
    }
  }

  /// [SurahDetailsScreen] app bar description
  String get appBarDescription {
    VerseModel verse;
    switch (quranProvider.localSetting.quranType) {
      case EQuranType.translation:
        verse = quranProvider.surahs[readingSettings.surahIndex].verses[readingSettings.verseIndex];
        break;
      case EQuranType.reading:
        verse = mushafPageList.first.first.verses.first;
    }
    return "${_context.translate.juz} ${verse.juzNumber} | ${_context.translate.hizb} ${verse.hizbNumber} - ${_context.translate.page} ${verse.pageNumber}";
  }

  /// Play or Pause The Verses
  void onTapVerseCardPlayOrPause(int index, bool isPlaying, String verseKey) {
    _context.read<PlayerProvider>().onTapPlayOrPause(index, isPlaying, showedVerses);
  }

  /// Play The Mushaf Page
  void playTheMushafPage(bool isPlaying, int surahId) {
    var index = showedSurahs.indexWhere((element) => element.id == surahId);
    List<VerseModel> selectedVerses = index == -1 ? [] : showedSurahs[index].verses;
    _context.read<PlayerProvider>().onTapPlayOrPause(0, isPlaying, selectedVerses);
  }

  /// Changing reading style in the home page
  /// EX: [Translation] or [Reading]
  void changeQuranType(int index) {
    quranProvider.localSetting.quranType = EQuranType.values.elementAt(index);
    switch (quranProvider.localSetting.quranType) {
      case EQuranType.translation:
        int index = showedVerses
            .indexWhere((element) => element.pageNumber == readingSettings.mushafPageNumber);
        if (index != -1) {
          readingSettings.surahId = showedVerses[index].surahId ?? 1;
          readingSettings.verseId = showedVerses[index].verseNumber ?? 1;
        }
        break;
      case EQuranType.reading:
        readingSettings.mushafPageNumber = quranProvider
            .surahs[readingSettings.surahIndex].verses[readingSettings.verseIndex].pageNumber!;
    }
    notifyListeners();
  }

  void changeReadingMode() {
    readingSettings.isReadingMode = !readingSettings.isReadingMode;
    notifyListeners();
  }

  /// Change type Juz, Surah or Search
  changeJuzOrSurahToggleOptionType(EJuzSurahToggleOptions newOptionType) {
    juzSurahToggleOptionType = newOptionType;
    notifyListeners();
  }

  /// Change type Grid or List
  changeJuzListType(EJuzListType newListType) {
    juzListType = newListType;
    notifyListeners();
  }

  /// Changing between toggle buttons and search bar
  changeToggleSearchOptions(EToggleSearchOptions newOptionType) {
    _context.read<SearchProvider>().toggleSearchOptions = newOptionType;
    notifyListeners();
  }
}
