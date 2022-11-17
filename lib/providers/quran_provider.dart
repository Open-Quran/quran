import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/local_setting_model.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_translation.dart';
import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/services/asset_quran_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class QuranProvider extends ChangeNotifier {
  /// Class Constructor
  QuranProvider() {
    getAllSurahs();
    getLocalSettingOfQuran();
  }

  /// List of surahs and verses
  List<SurahModel> surahs = [];

  /// Local Setting of Quran
  LocalSettingModel localSetting = LocalSettingModel();

  /// Verse Translations
  VerseTranslation? verseTranslation;

  /// Get surah which has sajda verses
  List<SurahModel> get sajdaSurahs {
    return surahs.where((element) => element.isSajdaVerse).toList();
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

  /// Changing Reading Type
  changeReadingType(int index){
    localSetting.readingType = EReadingType.values[index];
    setLocalSettingOfQuran();
  }
  /// Changing Font Size
  changeFontSize(dynamic value){
    localSetting.textScaleFactor = value;
    setLocalSettingOfQuran();
  }

  /// Get all [verseTranslation] from [AssetQuranService]
  Future<void> getVerseTranslation(BuildContext context) async {
    String languageCode = context.read<AppSettingsProvider>().appLocale!.languageCode;
    verseTranslation = await AssetQuranService.getVerseTranslation(languageCode);
    notifyListeners();
  }
}
