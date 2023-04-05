import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/providers/quran_provider.dart';

import '../constants/enums.dart';
import '../models/reading_settings_model.dart';
import '../models/surah_model.dart';
import '../models/verse_model.dart';
import 'app_settings_provider.dart';

class NewSurahDetailsProvider extends ChangeNotifier {
  /// Class Constructor
  NewSurahDetailsProvider(this._context, this.readingSettings, EQuranType quranType) {
    quranProvider.changeQuranType(quranType.index);
    // getNewDisplayedSurahs();
    // getNewDisplayedVerses();
    // getNewMushafPageList();
  }

  /// List of surahs and verses
  List<SurahModel> surahs = [];

  /// Reading settings model
  late ReadingSettingsModel readingSettings;

  /// Detail Screen Context
  final BuildContext _context;

  /// Get [QuranProvider]
  QuranProvider get quranProvider => _context.read<QuranProvider>();

  /// Get [AppSettingsProvider]
  AppSettingsProvider get appSettingsProvider => _context.read<AppSettingsProvider>();

  /// Get all surah verses
  List<VerseModel> get getAllVerses {
    List<VerseModel> verseList = [];
    for (var verse in surahs) {
      verseList.addAll(verse.verses);
    }
    return verseList;
  }
}
