import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/managers/surah_detail_navigation_manager.dart';
import 'package:fabrikod_quran/widgets/cards/surah_card.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  /// Home Screen Context
  final BuildContext _context;

  /// Juz List Type [EJuzListType]
  EJuzListType juzListType = EJuzListType.list;

  /// Home juz and surah toggle buttons
  EJuzSurahToggleOptions juzSurahToggleOptionType = EJuzSurahToggleOptions.juz;



  /// Change type Juz, Surah or Search
  changeJuzOrSurahToggleOptionType(EJuzSurahToggleOptions newOptionType) {
    juzSurahToggleOptionType = newOptionType;
    notifyListeners();
  }


  /// Change type Grid or List
  changeJuzListType(EJuzListType newListType) {
    juzListType = newListType;
    notifyListeners();
  }

  /// Class Constructor
  HomeProvider(this._context);

  /// Navigation to details when user clicks on [SurahCard]
  void onTapSurahCard(int surahId) {
    SurahDetailNavigationManager.goToSurah(_context, surahId);
    debugPrint("On Tap Surah Card : $surahId");
  }

  /// Navigation to details when user clicks on [GridCard]
  void onTapJuzCard(int juzId) {
    SurahDetailNavigationManager.goToSurah(_context, juzId);
    debugPrint("On Tap Juz Card : $juzId");
  }
}
