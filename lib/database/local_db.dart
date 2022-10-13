import 'package:fabrikod_quran/constants/constants.dart';
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
  static EThemeModes get getThemeMode {
    int? value = _localDbBox.read('themeMode');
    if (value == null) return EThemeModes.light;
    return EThemeModes.values[value];
  }

  /// Change ThemeMode From Local Database
  static Future<EThemeModes> setThemeMode(EThemeModes appThemeMode) async {
    await _localDbBox.write('themeMode', appThemeMode.index);
    return getThemeMode;
  }
}
