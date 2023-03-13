import 'dart:io';

import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:html_character_entities/html_character_entities.dart';

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
    const latin = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (int i = 0; i < latin.length; i++) {
      input = input.replaceAll(latin[i], arabic[i]);
    }
    return " $input ";
  }

  /// Returning true if string has number
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  static unFocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  /// Parse Html Quran Translation
  static String parseHtmlQuranTranslation(String value) {
    var result = HtmlCharacterEntities.decode(value);
    RegExp exp =
        RegExp(r"<[^>]+>.*?</sup>", multiLine: true, caseSensitive: true);
    return result.replaceAll(exp, '');
  }

  static bool isSmallPhone(BuildContext context) {
    return MediaQuery.of(context).size.height <= 668 ? true : false;
  }

  static bool isMediumPhone(BuildContext context) {
    return MediaQuery.of(context).size.height <= 844 ? true : false;
  }

  static bool isBigPhone(BuildContext context) {
    return MediaQuery.of(context).size.height <= 932 ? true : false;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.height <= 1400 ? true : false;
  }

  static bool get isIOS {
    return Platform.isIOS ? true : false;
  }
}
