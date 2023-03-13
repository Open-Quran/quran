import 'package:flutter/material.dart';

import '../constants/enums.dart';

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
}
