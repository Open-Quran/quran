import 'package:flutter/cupertino.dart';

import '../constants/enums.dart';
import '../models/reading_settings_model.dart';

class QuranProvider extends ChangeNotifier {
  /// Reading settings model
  late ReadingSettingsModel readingSettings;

  /// Class Constructor
  QuranProvider() {
    readingSettings = ReadingSettingsModel();
  }

  /// Changing reading style in the home page
  /// EX: Translation or Mushaf
  Future<void> changeReadingType(int index) async {
    readingSettings.readingType = ReadingType.values.elementAt(index);
    notifyListeners();
  }
}
