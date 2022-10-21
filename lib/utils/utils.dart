import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;

class Utils {
  Utils._();

  /// Parse [String] to [DateTime]
  static DateTime? dateParser(String? date) {
    if (date == null) return null;
    return DateTime.parse(date);
  }

  static bool isPlatformBrightnessDark(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;
  }

  /// Cleans the html code in the String
  static String skipHtml(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
