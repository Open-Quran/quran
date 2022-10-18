import 'package:flutter/cupertino.dart';

import '../constants/enums.dart';
import '../models/reading_settings_model.dart';

class QuranProvider extends ChangeNotifier {
  /// Class Constructor
  QuranProvider() {
    readingSettings = ReadingSettingsModel();
  }

  /// Reading settings model
  late ReadingSettingsModel readingSettings;

  /// Changing reading style in the home page
  /// EX: [Translation] or [Reading]
  Future<void> changeReadingType(int index) async {
    readingSettings.readingType = ReadingType.values.elementAt(index);
    notifyListeners();
  }

}
