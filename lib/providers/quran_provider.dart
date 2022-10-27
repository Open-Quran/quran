import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/services/asset_quran_service.dart';
import 'package:flutter/cupertino.dart';

class QuranProvider extends ChangeNotifier {
  /// Class Constructor
  QuranProvider() {
    getAllOfSurahs();
  }

  /// All of surahs and verses
  List<SurahModel> surahs = [];

  /// Get Surah of Sajda
  List<SurahModel> get sajdaSurahs {
    return surahs.where((element) => element.isSajdaVerse).toList();
  }

  /// Get all of surahs and verses from AssetQuranService
  Future<void> getAllOfSurahs() async {
    surahs = await AssetQuranService.getAllOfSurahs();
    notifyListeners();
  }
}
