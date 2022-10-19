import 'package:flutter/material.dart';

class Utils {
  Utils._();

  /// Parse [String] to [DateTime]
  static DateTime? dateParser(String? date) {
    if (date == null) return null;
    return DateTime.parse(date);
  }

  static bool isPlatformBrightnessDark (BuildContext context){
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;
  }
}
