import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/local_setting_model.dart';
import 'package:fabrikod_quran/models/mushaf_backgrund_model.dart';
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

  /// Changing Arabic Font Type
  changeFontTypeArabic(String value) {
    localSetting.fontTypeArabic = value;
    setLocalSettingOfQuran();
  }

  SurahDetailsPageThemeModel get surahDetailsPageThemeColor =>
      AppColors.mushafColors.elementAt(localSetting.surahDetailsPageThemeIndex);

  /// Changing Mushaf Background Color
  changeSurahDetailsPageTheme(int index) {
    localSetting.surahDetailsPageThemeIndex = index;
    setLocalSettingOfQuran();
  }
}
