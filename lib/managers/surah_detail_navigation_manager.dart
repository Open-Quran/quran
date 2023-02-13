import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurahDetailNavigationManager {
  SurahDetailNavigationManager._();

  /// Go to surah list on surah detail page
  static void gotoSurah(BuildContext context, int surahId, {int verseIndex = 0}) {
    _goToSurahDetail(
      context,
      ReadingSettingsModel(
        surahDetailScreenMod: ESurahDetailScreenMod.surah,
        surahIndex: surahId,
        surahVerseIndex: verseIndex,
      ),
    );
  }

  /// Go to Juz on surah detail page
  static void gotoJuz(BuildContext context, int juzIndex) {
    _goToSurahDetail(
      context,
      ReadingSettingsModel(
        surahDetailScreenMod: ESurahDetailScreenMod.juz,
        juzIndex: juzIndex,
      ),
    );
  }

  /// Go to Mushaf on surah detail page
  static void gotoMushaf(BuildContext context, int pageIndex) {
    _goToSurahDetail(
      context,
      ReadingSettingsModel(mushafPageNumber: pageIndex),
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
