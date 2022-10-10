import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalDb {
  LocalDb._();

  static final GetStorage _localDbBox = GetStorage('FabrikodQuran');

  /// Get Locale From Local Database
  static Locale? get getLocale {
    String? code = _localDbBox.read('languageCode');
    if (code == null) return null;
    return Locale(code);
  }

  /// Change Locale From Local Database
  static Future<Locale?> setLocale(String languageCode) async {
    await _localDbBox.write('languageCode', languageCode);
    return getLocale;
  }

  /// Get ThemeMode From Local Database
  static ThemeMode get getThemeMode {
    bool? value = _localDbBox.read('isDarkTheme');
    if (value == null) return ThemeMode.system;
    return value == true ? ThemeMode.dark : ThemeMode.light;
  }

  /// Change ThemeMode From Local Database
  static Future<ThemeMode> setThemeMode(ThemeMode themeMode) async {
    bool value = themeMode == ThemeMode.dark ? true : false;
    await _localDbBox.write('isDarkTheme', value);
    return getThemeMode;
  }
}
