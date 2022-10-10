import 'package:fabrikod_quran/databases/local_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// App Translate and Localization Helper Class
class TranslateHelper {
  TranslateHelper._();

  /// LocalizationsDelegates
  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  /// Delegate
  static LocalizationsDelegate get delegate => AppLocalizations.delegate;

  /// SupportedLocales
  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  /// of(context)
  static AppLocalizations? of(BuildContext context) => AppLocalizations.of(context);

  /// If we support the language of the device we update the default language
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
