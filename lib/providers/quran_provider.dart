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
  }

  /// List of surahs and verses
  List<SurahModel> surahs = [];

  /// Verse Translations
  VerseTranslation? verseTranslation;

  /// Get surah which has sajda verses
  List<SurahModel> get sajdaSurahs {
    return surahs.where((element) => element.isSajdaVerse).toList();
  }

  /// Get all the [surahs] and verses from the [AssetQuranService]
  Future<void> getAllSurahs() async {
    surahs = await AssetQuranService.getAllOfSurahs();
    notifyListeners();
  }

  /// Get all [verseTranslation] from [AssetQuranService]
  Future<void> getVerseTranslation(BuildContext context) async {
    String languageCode = context.read<AppSettingsProvider>().appLocale!.languageCode;
    verseTranslation = await AssetQuranService.getVerseTranslation(languageCode);
    notifyListeners();
  }
}
