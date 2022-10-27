import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  /// Home Screen Context
  final BuildContext _context;

  /// Class Constructor
  HomeProvider(this._context);

  /// Focus node for search field in the home screen
  final FocusNode searchBarFocusNode = FocusNode();

  /// Un-focus Search Field
  void searchBarFocusNodeUnFocus() {
    searchBarFocusNode.unfocus();
  }

  void onTapSurahCard(int surahId) {
    goToSurahDetailScreen(
      ReadingSettingsModel(surahDetailScreenMod: ESurahDetailScreenMod.surah, surahIndex: surahId),
    );
  }

  void onTapJuzCard(int juzIndex) {
    goToSurahDetailScreen(
      ReadingSettingsModel(surahDetailScreenMod: ESurahDetailScreenMod.juz, juzIndex: juzIndex),
    );
  }

  void onTapSajdaCard(int surahId) {
    goToSurahDetailScreen(
      ReadingSettingsModel(surahDetailScreenMod: ESurahDetailScreenMod.sajda, sajdaIndex: surahId),
    );
  }

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
