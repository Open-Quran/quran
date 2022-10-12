import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

/// Green Theme
final ThemeData themeGreen = ThemeData(
  primaryColor: ColorConstants.paleYellow,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.paleYellow,
    titleTextStyle: TextStyle(
      color: ColorConstants.green,
      fontSize: 20,
      fontFamily: Fonts.nunitoW900,
      fontWeight: FontWeight.w900,
    ),
    elevation: 0,
  ),
  indicatorColor: ColorConstants.green,
  iconTheme: const IconThemeData(color: ColorConstants.green),
  backgroundColor: ColorConstants.paleYellow,
  sliderTheme: const SliderThemeData(
    trackHeight: 2,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 0,
    ),
  ),
  secondaryHeaderColor: ColorConstants.green.withOpacity(0.4),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: ColorConstants.paleYellow,
  cardTheme: CardTheme(color: ColorConstants.green.withOpacity(0.1)),
  canvasColor: ColorConstants.green,
  dividerColor: ColorConstants.green.withOpacity(0.2),
  fontFamily: Fonts.nunito,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorConstants.paleYellow,
    elevation: 0,
    selectedItemColor: ColorConstants.green,
    unselectedItemColor: ColorConstants.green,
  ),
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ColorConstants.green),
  ),
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: ColorConstants.green,
    ),
    headlineMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ColorConstants.green,
    ),
    headlineSmall: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: ColorConstants.green,
    ),
    titleLarge: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorConstants.green,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: ColorConstants.green,
    ),
    titleSmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ColorConstants.green,
    ),
    subtitle1: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstants.green,
    ),
    labelLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.green,
    ),
    labelMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorConstants.green,
    ),
    labelSmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: ColorConstants.green,
    ),
    bodyText1: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.green,
    ),
    bodyText2: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.green,
    ),
    caption: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ColorConstants.green,
    ),
  ),
);
