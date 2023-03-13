import 'package:flutter/material.dart';

import '../constants/enums.dart';
import '../database/local_db.dart';

class AppSettingsProvider extends ChangeNotifier {
  /// Class constructor
  AppSettingsProvider() {
    appLocale = LocalDb.getLocale;
    appThemeMode = LocalDb.getThemeMode;
  }

  /// App Locale
  Locale? appLocale;

  /// App Theme Mode
  late EThemeModes appThemeMode;

  /// Change App Language
  Future<void> changeAppLanguage(String languageCode) async {
    appLocale = await LocalDb.setLocale(languageCode);
    notifyListeners();
  }

  /// Change App Theme
  Future<void> changeAppTheme(EThemeModes themeMode) async {
    appThemeMode = await LocalDb.setThemeMode(themeMode);
    notifyListeners();
  }

  /// Get language from device if [null] default to [en]
  Locale? localeResolutionCallback(
      Locale? deviceLocale, Iterable<Locale> supportedLocales) {
    if (appLocale != null) return appLocale;

    for (var locale in supportedLocales) {
      if (locale.languageCode == deviceLocale!.languageCode) {
        appLocale = deviceLocale;
        return deviceLocale;
      }
    }
    appLocale = const Locale('en');
    return appLocale;
  }
}
