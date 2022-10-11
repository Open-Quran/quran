import 'package:fabrikod_quran/database/local_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// App Translate and Localization Helper Class
class TranslateHelper {
  TranslateHelper._();

  /// List Of Localization Delegates
  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  /// Localization Delegate
  static LocalizationsDelegate get delegate => AppLocalizations.delegate;

  /// Supported Locales
  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  /// Getting Build context
  static AppLocalizations? of(BuildContext context) => AppLocalizations.of(context);

  /// Getting local language from device (if app lang does not match local lang EN will be defaulted)
  static Locale? localeResolutionCallback(Locale? deviceLocale, Iterable<Locale> supportedLocales) {
    Locale? locale = LocalDb.getLocale;
    if (locale != null) return locale;

    for (var locale in supportedLocales) {
      if (locale.languageCode == deviceLocale!.languageCode) {
        return deviceLocale;
      }
    }
    return const Locale('en');
  }
}
