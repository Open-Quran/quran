import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension EThemeModesExtension on EThemeModes {
  /// Getting [EThemeModes] names
  String name(BuildContext context) {
    switch (this) {
      case EThemeModes.light:
        return context.translate.lightMode;
      case EThemeModes.dark:
        return context.translate.darkMode;
      case EThemeModes.quran:
        return context.translate.quranMode;
      case EThemeModes.green:
        return context.translate.greenMode;
    }
  }
}

extension ESupportedLanguageExtension on ESupportedLanguage {
  /// Getting [ESupportedLanguage] titles
  String title(BuildContext context) {
    switch (this) {
      case ESupportedLanguage.en:
        return "English";
      case ESupportedLanguage.tr:
        return "Turkish";
    }
  }
}

extension BuildContextExtension on BuildContext {
  /// Helping function to translate the text
  AppLocalizations get translate {
    return AppLocalizations.of(this)!;
  }

  /// Helping function to get the [theme]
  ThemeData get theme {
    return Theme.of(this);
  }
}
