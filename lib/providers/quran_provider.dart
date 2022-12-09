import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/local_setting_model.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/services/asset_quran_service.dart';
import 'package:fabrikod_quran/services/translation_service.dart';
import 'package:flutter/cupertino.dart';

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

  /// Get all surah verses
  List<VerseModel> get getAllVerses {
    List<VerseModel> verseList = [];
    for (var verse in surahs) {
      verseList.addAll(verse.verses);
    }
    return verseList;
  }

  Future<void> selectedTranslation(int? index) async {
    await translationService.selectedTranslation(index);
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
  changeReadingType(int index) {
    localSetting.readingType = EReadingType.values[index];
    setLocalSettingOfQuran();
  }

  /// Changing Font Size
  changeFontSize(dynamic value) {
    localSetting.textScaleFactor = value;
    setLocalSettingOfQuran();
  }

  /// Changing Arabic Font Size
  changeFontSizeArabic(dynamic value) {
    localSetting.textScaleFactorArabic = value;
    setLocalSettingOfQuran();
  }

  /// Changing Font Type
  changeFontType(String value) {
    localSetting.fontType = value;
    setLocalSettingOfQuran();
  }

  /// Changing Arabic Font Type
  changeFontTypeArabic(String value) {
    localSetting.fontTypeArabic = value;
    setLocalSettingOfQuran();
  }
}
