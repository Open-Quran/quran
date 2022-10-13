import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  /// App Locale
  Locale? appLocale;

  /// App Theme Mode
  late EThemeModes appThemeMode;

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
  Future<void> changeAppTheme(EThemeModes themeMode) async {
    appThemeMode = await LocalDb.setThemeMode(themeMode);
    notifyListeners();
  }

  /// If we support the language of the device we update the default language
  Locale? localeResolutionCallback(Locale? deviceLocale, Iterable<Locale> supportedLocales) {
    if (appLocale != null) return appLocale;

    for (var locale in supportedLocales) {
      if (locale.languageCode == deviceLocale!.languageCode) {
        return deviceLocale;
      }
    }
    return const Locale('en');
  }
}
