import 'dart:convert';

import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_translation.dart';
import 'package:flutter/services.dart';

class AssetQuranService {
  AssetQuranService._();

  /// Get all surahs and verses from assets
  static Future<List<SurahModel>> getAllOfSurahs() async {
    String data = await rootBundle.loadString(JsonPathConstants.quran);
    var result = json.decode(data) as List;
    return result.map((e) => SurahModel.fromJson(e)).toList().cast<SurahModel>();
  }

  static Future<VerseTranslation> getVerseTranslation(String languageCode) async {
    String data = await rootBundle.loadString(JsonPathConstants.verseTranslations(languageCode));
    var result = json.decode(data);
    return VerseTranslation.fromJson(result);
  }
  
}
