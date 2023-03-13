import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';
import '../constants/enums.dart';
import '../database/local_db.dart';
import '../managers/translation_download_manager.dart';
import '../models/local_setting_model.dart';
import '../models/mushaf_backgrund_model.dart';
import '../models/surah_model.dart';
import '../models/translation.dart';
import '../models/verse_model.dart';
import '../services/asset_quran_service.dart';
import '../services/translation_service.dart';

class QuranProvider extends ChangeNotifier {
  /// Class Constructor
  QuranProvider() {
    getAllSurahs();
    getLocalSettingOfQuran();
    translationService = TranslationService();
  }

  late TranslationService translationService;

  /// List of surahs and verses
  List<SurahModel> surahs = [];

  /// Local Setting of Quran
  LocalSettingModel localSetting = LocalSettingModel();

  /// Get surah which has sajda verses
  List<SurahModel> get sajdaSurahs {
    return surahs.where((element) => element.isSajdaVerse).toList();
  }

  /// Get Juz with surahs
  List<List<SurahModel>> get juzList {
    List<List<SurahModel>> juz = List.generate(30, (_) => [], growable: false);
    for (var surah in surahs) {
      for (var element in surah.juzNumbers) {
        juz[element - 1].add(surah);
      }
    }
    return juz;
  }

  /// Get all surah verses
  List<VerseModel> get getAllVerses {
    List<VerseModel> verseList = [];
    for (var verse in surahs) {
      verseList.addAll(verse.verses);
    }
    return verseList;
  }

  /// Get all surah verses
  List<VerseModel> get getAllVerseTranslations {
    List<VerseModel> verseList = [];
    for (var verse in surahs) {
      verseList.addAll(verse.verses);
    }
    return verseList;
  }

  /// Selecting translation
  /// If translation is not downloaded - Download it
  /// If translation is downloaded then select translation
  Future<void> onTapTranslationAuthorCard(TranslationAuthor translationAuthor) async {
    switch (translationAuthor.verseTranslationState) {
      case EVerseTranslationState.download:
        translationAuthor.verseTranslationState = EVerseTranslationState.downloading;
        notifyListeners();
        var result = await translationService.downloadTranslationFromNetwork(translationAuthor);
        translationAuthor.verseTranslationState =
            result ? EVerseTranslationState.downloaded : EVerseTranslationState.download;

        break;
      case EVerseTranslationState.downloading:
        break;
      case EVerseTranslationState.downloaded:
        if (translationAuthor.isTranslationSelected) {
          if (translationService.selectedTranslationAuthors.length > 1) {
            translationAuthor.isTranslationSelected = false;
            TranslationDownloadManager.changeSelectedStateOfAuthor(translationAuthor.resourceId!, false);
          }
        } else {
          translationAuthor.isTranslationSelected = true;
          TranslationDownloadManager.changeSelectedStateOfAuthor(translationAuthor.resourceId!, true);
        }
        break;
    }
    notifyListeners();
  }

  /// Getting Local Setting Of quran From DB
  void getLocalSettingOfQuran() {
    localSetting = LocalDb.getLocalSettingOfQuran;
    notifyListeners();
  }

  /// Adding Local Setting Of quran to DB
  Future<void> setLocalSettingOfQuran() async {
    localSetting = await LocalDb.setLocalSettingOfQuran(localSetting);
    notifyListeners();
  }

  /// Get all the [surahs] and verses from the [AssetQuranService]
  Future<void> getAllSurahs() async {
    surahs = await AssetQuranService.getAllOfSurahs();
    notifyListeners();
  }

  /// Changing Quran Type
  changeQuranType(int index) {
    localSetting.quranType = EQuranType.values[index];
    setLocalSettingOfQuran();
  }

  /// Changing Reading Type
  changeReadingType(EReadOptions readOptions) {
    localSetting.readOptions = readOptions;
    setLocalSettingOfQuran();
  }

  /// Changing Layout Options
  changeLayoutOptions(ELayoutOptions layoutOptions) {
    localSetting.layoutOptions = layoutOptions;
    setLocalSettingOfQuran();
  }

  /// Changing Font Size
  changeFontSize(dynamic value) {
    localSetting.textScaleFactor = value;
    setLocalSettingOfQuran();
  }

  /// Changing Font Type
  changeFontType(String value) {
    localSetting.fontType = value;
    setLocalSettingOfQuran();
  }

  /// Changing arabic font type
  changeFontTypeArabic(String value) {
    localSetting.fontTypeArabic = value;
    setLocalSettingOfQuran();
  }

  /// Getting surah details theme
  SurahDetailsPageThemeModel get surahDetailsPageThemeColor =>
      AppColors.mushafColors.elementAt(localSetting.surahDetailsPageThemeIndex);

  /// Changing surah details background color
  changeSurahDetailsPageTheme(int index) {
    localSetting.surahDetailsPageThemeIndex = index;
    setLocalSettingOfQuran();
  }

  /// Delete a Downloaded Translation
  deleteTranslationAuthor(TranslationAuthor translationAuthor) async {
    await translationService.deleteTranslationAuthor(translationAuthor);
    notifyListeners();
  }
}
