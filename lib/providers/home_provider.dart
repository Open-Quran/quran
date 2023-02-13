import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/managers/surah_detail_navigation_manager.dart';
import 'package:fabrikod_quran/widgets/cards/surah_card.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  /// Home Screen Context
  final BuildContext _context;

  /// Juz List Type [EJuzListType]
  EJuzListType juzListType = EJuzListType.list;

  /// Home toggle buttons
  EHomeToggleOptions homeToggleOptionType = EHomeToggleOptions.juz;

  /// Enum toggle search options
  EToggleSearchOptions toggleSearchOptions = EToggleSearchOptions.toggles;

  /// Change type Juz, Surah or Search
  changeHomeToggleOptionType(EHomeToggleOptions newOptionType) {
    homeToggleOptionType = newOptionType;
    notifyListeners();
  }

  /// Changing between toggle buttons and search bar
  changeToggleSearchOptions(EToggleSearchOptions newOptionType) {
    toggleSearchOptions = newOptionType;
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
    SurahDetailNavigationManager.gotoSurah(_context, surahId);
  }

  /// Navigation to details when user clicks on [GridCard]
  void onTapJuzCard(int juzId) {
    SurahDetailNavigationManager.gotoSurah(_context, juzId);
  }
}
