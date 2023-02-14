import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurahDetailNavigationManager {
  SurahDetailNavigationManager._();

  /// Go to surah list on surah detail page
  static void gotoSurah(BuildContext context, int surahId, {int verseId = 0}) {
    _goToSurahDetail(
      context,
      ReadingSettingsModel(
        surahDetailScreenMod: ESurahDetailScreenMod.surah,
        surahId: surahId,
        verseId: verseId,
      ),
    );
  }

  /// Go to Juz on surah detail page
  static void gotoJuz(BuildContext context, int juzId) {
    _goToSurahDetail(
      context,
      ReadingSettingsModel(
        surahDetailScreenMod: ESurahDetailScreenMod.juz,
        juzId: juzId,
      ),
    );
  }

  /// Go to Mushaf on surah detail page
  static void gotoMushaf(BuildContext context, int pageNumber) {
    _goToSurahDetail(
      context,
      ReadingSettingsModel(mushafPageNumber: pageNumber),
      quranType: EQuranType.reading,
    );
  }

  /// Navigate To Surah Detail
  static void _goToSurahDetail(
    BuildContext context,
    ReadingSettingsModel readingModel, {
    EQuranType quranType = EQuranType.translation,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SurahDetailsProvider(context, readingModel, quranType),
          child: const SurahDetailsScreen(),
        ),
      ),
    );
  }
}
