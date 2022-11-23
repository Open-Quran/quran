import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:fabrikod_quran/widgets/cards/juz_card.dart';
import 'package:fabrikod_quran/widgets/cards/surah_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  /// Home Screen Context
  final BuildContext _context;

  /// Class Constructor
  HomeProvider(this._context) {
    _context.read<QuranProvider>().getVerseTranslation(_context);
  }

  /// Navigation to details when user clicks on [SurahCard]
  void onTapSurahCard(int surahId) {
    goToSurahDetailScreen(
      ReadingSettingsModel(surahDetailScreenMod: ESurahDetailScreenMod.surah, surahIndex: surahId),
    );
  }

  /// Navigation to details when user clicks on [JuzCard]
  void onTapJuzCard(int juzIndex) {
    goToSurahDetailScreen(
      ReadingSettingsModel(surahDetailScreenMod: ESurahDetailScreenMod.juz, juzIndex: juzIndex),
    );
  }

  /// Navigation to Sajda ayat
  void onTapSajdaCard(int surahId) {
    goToSurahDetailScreen(
      ReadingSettingsModel(surahDetailScreenMod: ESurahDetailScreenMod.sajda, sajdaIndex: surahId),
    );
  }

  /// Navigates to the details page [SurahDetailsScreen]
  void goToSurahDetailScreen(ReadingSettingsModel model) {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SurahDetailsProvider(context, model),
          child: const SurahDetailsScreen(),
        ),
      ),
    );
  }
}
