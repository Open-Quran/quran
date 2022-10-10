import 'package:fabrikod_quran/databases/local_db.dart';
import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  /// App Locale
  Locale? appLocale;

  /// App Theme Mode
  ThemeMode appThemeMode = ThemeMode.system;

  AppSettingsProvider() {
    appLocale = LocalDb.getLocale;
    appThemeMode = LocalDb.getThemeMode;
  }

  /// Change App Language
  Future<void> changeAppLanguage(String languageCode) async {
    appLocale = await LocalDb.setLocale(languageCode);
    notifyListeners();
  }

  /// Change App Theme
  Future<void> changeAppTheme(ThemeMode themeMode) async {
    appThemeMode = await LocalDb.setThemeMode(themeMode);
    notifyListeners();
  }
}
