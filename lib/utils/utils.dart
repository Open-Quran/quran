import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;

class Utils {
  Utils._();

  /// Parse [String] to [DateTime]
  static DateTime? dateParser(String? date) {
    if (date == null) return null;
    return DateTime.parse(date);
  }

  /// Checking if platform has dark mode
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

  /// Changing numbers to arabic
  static String getArabicVerseNo(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰ ', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }

  /// Returning true if string has number
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }
}
