import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

extension EnumExtension on EThemeModes {
  /// Get Theme Data for EThemeModes
  ThemeData get getThemeData {
    switch (this) {
      case EThemeModes.light:
        return themeLight;
      case EThemeModes.dark:
        return themeDark;
      case EThemeModes.quran:
        return themeQuran;
      case EThemeModes.green:
        return themeGreen;
    }
  }
}
