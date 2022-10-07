import 'package:fabrikod_quran/l10n/translate_helper.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  Locale? appLocale;

  SettingsProvider() {
    appLocale = TranslateHelper.getLocale;
  }

  Future<void> changeAppLanguage(String languageCode) async {
    appLocale = await TranslateHelper.setLocale(languageCode);
    notifyListeners();
  }
}
