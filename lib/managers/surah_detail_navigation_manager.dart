import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/local_db.dart';
import '../models/recent_model.dart';

class SurahDetailNavigationManager {
  SurahDetailNavigationManager._();

  /// Navigation to the surah details from surah list
  static Future<void> goToSurah(BuildContext context, int surahId, {int verseId = 1}) async {
   await _goToSurahDetail(
      context,
      ReadingSettingsModel(
        surahDetailScreenMode: ESurahDetailScreenMode.surah,
        surahId: surahId,
        verseId: verseId,
      ),
    );
    LocalDb.addRecent(RecentModel(
        eRecentVisitedType: ERecentVisitedType.surah, index: surahId));
  }

  /// Navigation to the surah details from juz list
  static Future<void> goToJuz(BuildContext context, int juzId) async{
    await _goToSurahDetail(
      context,
      ReadingSettingsModel(
        surahDetailScreenMode: ESurahDetailScreenMode.juz,
        juzId: juzId,
      ),
    );
    LocalDb.addRecent(RecentModel(
        eRecentVisitedType: ERecentVisitedType.juz, index: juzId));
  }

  /// Navigation to the reading/mushaf surah details
  static Future<void> goToMushaf(BuildContext context, int pageNumber) async {
   await _goToSurahDetail(
      context,
      ReadingSettingsModel(mushafPageNumber: pageNumber),
      quranType: EQuranType.reading,
    );
    LocalDb.addRecent(RecentModel(
        eRecentVisitedType: ERecentVisitedType.page, index: pageNumber));
  }

  /// Navigation to the surah details
  static Future<void> _goToSurahDetail(
    BuildContext context,
    ReadingSettingsModel readingModel, {
    EQuranType quranType = EQuranType.translation,
  }) async {
   await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) =>
              SurahDetailsProvider(context, readingModel, quranType),
          child: const SurahDetailsScreen(),
        ),
      ),
    );
  }
}
