import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalDb {
  LocalDb._();

  static final GetStorage _localDbBox = GetStorage('FabrikodQuran');

  static String? get getLanguageCode => _localDbBox.read('languageCode');

  static Future setLanguageCode(String languageCode) async {
    await _localDbBox.write('languageCode', languageCode);
  }

  static ThemeMode get getThemeMode {
    bool? value = _localDbBox.read('isDarkTheme');
    if (value == null) return ThemeMode.system;
    return value == true ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<ThemeMode> setThemeMode(ThemeMode themeMode) async {
    bool value = themeMode == ThemeMode.dark ? true : false;
    await _localDbBox.write('isDarkTheme', value);
    return getThemeMode;
  }
}
