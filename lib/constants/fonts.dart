import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

/// App Fonts
class Fonts {
  Fonts._();

  static final String nunitoW900 = GoogleFonts.nunito(fontWeight: FontWeight.w900).fontFamily!;

  /// For Verse Signs
  static const String uthmanic = "Uthmani";
  static const String uthmanicIcon = "UthmaniIcon";
  static const String uthmanicBold = "UthmaniBold";
  static const String majeed = "Majeed";

  /// Translation Fonts
  static final String robotoSlab = GoogleFonts.robotoSlab().fontFamily!;
  static final String nunito = GoogleFonts.nunito().fontFamily!;

  /// Arabic Fonts
  static final String amiri = GoogleFonts.amiri().fontFamily ?? uthmanic;
  static final String lateef = GoogleFonts.lateef().fontFamily ?? uthmanic;
  static final String notoNaskhArabic = GoogleFonts.notoNaskhArabic().fontFamily ?? uthmanic;

  static const List<String> translationFontNames = ["Nunito", "Roboto Slab"];
  static const List<String> arabicFontNames = ["Uthmani", "Uthmani Bold", "Majeed"];

  static String? getTranslationFont(String fontName) {
    if (fontName == translationFontNames[1]) return robotoSlab;
    return nunito;
  }

  static String? getArabicFont(String fontName) {
    if (fontName == arabicFontNames[1]) return uthmanicBold;
    if (fontName == arabicFontNames[2]) return majeed;
    return uthmanic;
  }
}
