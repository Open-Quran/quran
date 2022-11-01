import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreProvider extends ChangeNotifier {
  /// Home Screen Context
  final BuildContext _context;

  /// Class Constructor
  MoreProvider(this._context);

  /// Change App Language And Get Verses Translations
  Future<void> changeAppLanguage(String languageCode) async {
    _context.read<AppSettingsProvider>().changeAppLanguage(languageCode);
    _context.read<QuranProvider>().getVerseTranslation(languageCode);
  }
}
