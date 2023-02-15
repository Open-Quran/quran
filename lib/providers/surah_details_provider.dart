import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SurahDetailsProvider extends ChangeNotifier {
  /// Class Constructor
  SurahDetailsProvider(this._context, this.readingSettings, EQuranType quranType) {
    // quranProvider.changeQuranType(quranType.index);
    // itemPositionsListener.itemPositions.addListener(scrollListener);
    readingSettings.mushafPageNumber = versesOfReadingTypeOrTranslation.first.pageNumber ?? 1;

    ///todo
    ///pageController = PageController(initialPage: readingSettings.mushafPageNumber - 1);
  }

  /// Detail Screen Context
  final BuildContext _context;

  /// is Quran Screen Setting open
  bool isOpenSetting = false;

  /// is Quran Screen Title Menu open
  bool isTitleMenu = false;

  /// Change Quran Screen Setting Mode
  void changeOpenSetting() {
    isOpenSetting = !isOpenSetting;
    notifyListeners();
  }

  /// Change Quran Screen Setting Mode
  void changeTitleMenuState() {
    isTitleMenu = !isTitleMenu;
    notifyListeners();
  }

  /// Reading settings model
  late ReadingSettingsModel readingSettings;

  /// Scroll Controller for Verse List
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Item position listener of Verse list
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  /// Scroll Listener
  void scrollListener() {
    if (readingSettings.surahDetailScreenMod != ESurahDetailScreenMod.surah) return;
    // readingSettings.verseIndex = itemPositionsListener.itemPositions.value.first.index;
  }

  void initAfterScreen() {
    if (readingSettings.surahDetailScreenMod == ESurahDetailScreenMod.surah) {
      // itemScrollController.jumpTo(index: readingSettings.verseIndex);
    }
  }

  /// Get [QuranProvider]
  QuranProvider get quranProvider => _context.read<QuranProvider>();

  /// Get [AppSettingsProvider]
  AppSettingsProvider get appSettingsProvider => _context.read<AppSettingsProvider>();

  /// [SurahDetailsScreen] app bar title
  String get appBarTitle {
    switch (quranProvider.localSetting.quranType) {
      case EQuranType.translation:
        switch (readingSettings.surahDetailScreenMod) {
          case ESurahDetailScreenMod.surah:
            return quranProvider.surahs[readingSettings.surahIndex].nameSimple ?? "";
          case ESurahDetailScreenMod.juz:
            return "${_context.translate.juz} - ${readingSettings.juzId}";
        }
      case EQuranType.reading:
        return surahsOfMushafPage.first.nameSimple ?? "";
    }
  }

  /// Getting Verses Of Reading Type or Translation
  List<VerseModel> get versesOfReadingTypeOrTranslation {
    switch (readingSettings.surahDetailScreenMod) {
      case ESurahDetailScreenMod.surah:
        return quranProvider.surahs[readingSettings.surahIndex].verses;
      case ESurahDetailScreenMod.juz:
        List<VerseModel> list = [];
        for (var element in quranProvider.surahs) {
          list.addAll(element.juzVerses(readingSettings.juzIndex));
        }
        return list;
    }
  }

  /// Play or Pause The Verses
  void onTapVerseCardPlayOrPause(int index, bool isPlaying, String verseKey) {
    var verses = versesOfReadingTypeOrTranslation;
    _context.read<PlayerProvider>().onTapPlayOrPause(index, isPlaying, verses);
  }

  /// Play The Mushaf Page
  void playTheMushafPage(bool isPlaying, int surahId) {
    var index = surahsOfMushafPage.indexWhere((element) => element.id == surahId);
    List<VerseModel> selectedVerses = index == -1 ? [] : surahsOfMushafPage[index].verses;
    _context.read<PlayerProvider>().onTapPlayOrPause(0, isPlaying, selectedVerses);
  }

  List<SurahModel> get surahsOfMushafPage {
    List<SurahModel> list = [];
    for (var surah in quranProvider.surahs) {
      var newSurah = surah.surahOfMushafPage(readingSettings.mushafPageNumber);
      if (newSurah != null) list.add(newSurah);
    }
    return list;
  }

  List<SurahModel> getSurahOfMushafPage(int pageNo) {
    List<SurahModel> list = [];
    for (var surah in quranProvider.surahs) {
      var newSurah = surah.surahOfMushafPage(pageNo);
      if (newSurah != null) list.add(newSurah);
    }
    return list;
  }

  /// Getting Verses Of selected Surah
  List<VerseModel> get versesOfSelectedSurah {
    return quranProvider.surahs[readingSettings.surahIndex].verses;
  }

  /// Changing reading style in the home page
  /// EX: [Translation] or [Reading]
  void changeQuranType(int index) {
    quranProvider.localSetting.quranType = EQuranType.values.elementAt(index);
    if (quranProvider.localSetting.quranType == EQuranType.reading) {
      readingSettings.mushafPageNumber = versesOfReadingTypeOrTranslation.first.pageNumber ?? 1;

      ///todo
      ///pageController.jumpToPage(readingSettings.mushafPageNumber - 1);
    } else {
      readingSettings.surahId = surahsOfMushafPage.first.verses.first.surahId!;
      readingSettings.verseId = surahsOfMushafPage.first.verses.first.verseNumber!;
    }
    notifyListeners();
  }

  /// Changing Surah detail screen mod in the drawer menu
  /// EX: [Surah] or [Juz] or [Sajda]
  void changeSurahDetailScreenMod(int index) {
    readingSettings.surahDetailScreenMod = ESurahDetailScreenMod.values.elementAt(index);
    notifyListeners();
  }

  void changeSurahIndex(int index) {
    readingSettings.surahIndex = index;
    readingSettings.verseIndex = 0;
    readingSettings.mushafPageNumber = versesOfReadingTypeOrTranslation.first.pageNumber!;

    ///todo
    ///pageController.jumpToPage(readingSettings.mushafPageNumber - 1);
    // itemScrollController.jumpTo(index: 0);
    notifyListeners();
  }

  void changeSurahVerseIndex(int index) {
    readingSettings.verseIndex = index;
    readingSettings.mushafPageNumber = versesOfReadingTypeOrTranslation[index].pageNumber!;

    ///todo
    ///pageController.jumpToPage(readingSettings.mushafPageNumber - 1);
    // itemScrollController.jumpTo(index: index);
    notifyListeners();
  }

  void selectJuz(int index) {
    readingSettings.juzIndex = index;

    ///todo
    ///pageController.jumpToPage(readingSettings.mushafPageNumber - 1);
    Navigator.pop(_context);
    notifyListeners();
  }

  ///todo
  // void changeMushafPageNumberForButton(int index) {
  //   readingSettings.mushafPageNumber = index;
  //   pageController.jumpToPage(index - 1);
  //   notifyListeners();
  // }
  ///todo
  // void changeMushafPageNumberForScroll(int index) {
  //   readingSettings.mushafPageNumber = index + 1;
  //   notifyListeners();
  // }

  void changeReadingMode() {
    readingSettings.isReadingMode = !readingSettings.isReadingMode;
    notifyListeners();
  }
}
