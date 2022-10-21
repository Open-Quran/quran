import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/services/asset_quran_service.dart';
import 'package:flutter/cupertino.dart';

import '../constants/enums.dart';
import '../models/reading_settings_model.dart';

class QuranProvider extends ChangeNotifier {
  /// Class Constructor
  QuranProvider() {
    readingSettings = ReadingSettingsModel();
    getAllOfSurahs();
  }

  /// Reading settings model
  late ReadingSettingsModel readingSettings;

  /// All of surahs and verses
  List<SurahModel> surahs = [];

  /// Get all of surahs and verses from AssetQuranService
  Future<void> getAllOfSurahs() async {
    surahs = await AssetQuranService.getAllOfSurahs();
    notifyListeners();
  }

  /// Changing reading style in the home page
  /// EX: [Translation] or [Reading]
  Future<void> changeReadingType(int index) async {
    readingSettings.readingType = ReadingType.values.elementAt(index);
    notifyListeners();
  }
}
