import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurahDetailsProvider extends ChangeNotifier {
  /// Class Constructor
  SurahDetailsProvider(this._context, this.readingSettings) {
    if (quranProvider.verseTranslation != null) return;
    quranProvider.getVerseTranslation(appSettingsProvider.appLocale!.languageCode);
  }

  /// Detail Screen Context
  final BuildContext _context;

  /// Reading settings model
  late ReadingSettingsModel readingSettings;

  QuranProvider get quranProvider => _context.read<QuranProvider>();

  AppSettingsProvider get appSettingsProvider => _context.read<AppSettingsProvider>();

  String get appBarTitle {
    switch (readingSettings.readingType) {
      case EReadingType.translation:
        switch (readingSettings.surahDetailScreenMod) {
          case ESurahDetailScreenMod.surah:
            return quranProvider.surahs[readingSettings.surahIndex].nameSimple ?? "";
          case ESurahDetailScreenMod.juz:
            return "${_context.translate.juz} - ${readingSettings.juzIndex + 1}";
          case ESurahDetailScreenMod.sajda:
            return quranProvider.sajdaSurahs[readingSettings.sajdaIndex].nameSimple ?? "";
        }
      case EReadingType.reading:
        return surahsOfMushafPage.first.nameSimple ?? "";
    }
  }

  List<VerseModel> get versesOfReadingTypeTranslation {
    switch (readingSettings.surahDetailScreenMod) {
      case ESurahDetailScreenMod.surah:
        return quranProvider.surahs[readingSettings.surahIndex].verses;
      case ESurahDetailScreenMod.juz:
        List<VerseModel> list = [];
        for (var element in quranProvider.surahs) {
          list.addAll(element.juzVerses(readingSettings.juzIndex));
        }
        return list;
      case ESurahDetailScreenMod.sajda:
        var surahs = quranProvider.sajdaSurahs[readingSettings.sajdaIndex].verses;
        return [surahs.firstWhere((element) => element.sajdahNumber != null)];
    }
  }

  List<SurahModel> get surahsOfMushafPage {
    List<SurahModel> list = [];
    for (var surah in quranProvider.surahs) {
      var newSurah = surah.surahOfMushafPage(readingSettings.mushafPageNumber);
      if (newSurah != null) list.add(newSurah);
    }
    return list;
  }

  /// Changing reading style in the home page
  /// EX: [Translation] or [Reading]
  void changeReadingType(int index) {
    readingSettings.readingType = EReadingType.values.elementAt(index);
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
    readingSettings.surahVerseIndex = 0;
    notifyListeners();
  }

  void changeSurahVerseIndex(int index) {
    readingSettings.surahVerseIndex = index;
    notifyListeners();
  }

  void selectJuz(int index) {
    readingSettings.juzIndex = index;
    Navigator.pop(_context);
    notifyListeners();
  }

  void changeSajdaIndex(int index) {
    readingSettings.sajdaIndex = index;
    notifyListeners();
  }

  void changeMushafPage(int index) {
    readingSettings.mushafPageNumber = index;
    notifyListeners();
  }
}
