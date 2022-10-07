import 'package:fabrikod_quran/databases/local_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TranslateHelper {
  TranslateHelper._();

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  static LocalizationsDelegate get delegate => AppLocalizations.delegate;

  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  static AppLocalizations? of(BuildContext context) => AppLocalizations.of(context);

  static Locale? get getLocale {
    String? code = LocalDb.getLanguageCode;
    return code == null ? null : Locale(code);
  }

  static Future<Locale?> setLocale(String languageCode) async {
    await LocalDb.setLanguageCode(languageCode);
    return getLocale;
  }

  static Locale? localeResolutionCallback(Locale? deviceLocale, Iterable<Locale> supportedLocales) {
    Locale? locale = getLocale;
    if (locale != null) return locale;

    for (var locale in supportedLocales) {
      if (locale.languageCode == deviceLocale!.languageCode) {
        return deviceLocale;
      }
    }
    return const Locale('en');
  }
}
