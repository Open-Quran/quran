import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/databases/local_db.dart';
import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  /// App Locale
  Locale? appLocale;

  /// App Theme Mode
  late ThemeData appThemeData;

  AppSettingsProvider() {
    appLocale = LocalDb.getLocale;
    appThemeData = LocalDb.getThemeData;
  }

  /// Change App Language
  Future<void> changeAppLanguage(String languageCode) async {
    appLocale = await LocalDb.setLocale(languageCode);
    notifyListeners();
  }

  /// Change App Theme
  Future<void> changeAppTheme(EThemeModes themeMode) async {
    appThemeData = await LocalDb.setThemeMode(themeMode);
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
