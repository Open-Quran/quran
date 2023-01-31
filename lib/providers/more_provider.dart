import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreProvider extends ChangeNotifier {
  /// Home Screen Context
  final BuildContext _context;

  /// Class Constructor
  MoreProvider(this._context);

  /// Change app Language and get verses translations
  Future<void> changeAppLanguage(String languageCode) async {
    _context.read<AppSettingsProvider>().changeAppLanguage(languageCode);
  }
}
