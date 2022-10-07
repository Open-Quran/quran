import 'package:fabrikod_quran/databases/local_db.dart';
import 'package:fabrikod_quran/l10n/translate_helper.dart';
import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  Locale? appLocale;
  ThemeMode appThemeMode = ThemeMode.system;

  AppSettingsProvider() {
    appLocale = TranslateHelper.getLocale;
    appThemeMode = LocalDb.getThemeMode;
  }

  Future<void> changeAppLanguage(String languageCode) async {
    appLocale = await TranslateHelper.setLocale(languageCode);
    notifyListeners();
  }

  Future<void> changeAppTheme(ThemeMode themeMode) async {
    appThemeMode = await LocalDb.setThemeMode(themeMode);
    notifyListeners();
  }
}
