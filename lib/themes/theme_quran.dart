import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

/// Quran Theme
final ThemeData themeQuran = ThemeData(
  primaryColor: ColorConstants.yellow,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.yellow,
    titleTextStyle: TextStyle(
      color: ColorConstants.brown,
      fontSize: 20,
      fontFamily: Fonts.nunitoW900,
      fontWeight: FontWeight.w900,
    ),
    elevation: 0,
  ),
  indicatorColor:  ColorConstants.brown,
  iconTheme: const IconThemeData(color: ColorConstants.brown),
  backgroundColor: ColorConstants.yellow,
  sliderTheme: const SliderThemeData(
    trackHeight: 2,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 0,
    ),
  ),
  secondaryHeaderColor: ColorConstants.brown.withOpacity(0.4),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: ColorConstants.yellow,
  cardTheme: CardTheme(color: ColorConstants.brown.withOpacity(0.1)),
  canvasColor: ColorConstants.brown,
  dividerColor: ColorConstants.brown.withOpacity(0.2),
  fontFamily: Fonts.nunito,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorConstants.yellow,
    elevation: 0,
    selectedItemColor: ColorConstants.brown,
    unselectedItemColor: ColorConstants.brown,
  ),
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ColorConstants.brown),
  ),
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: ColorConstants.brown,
    ),
    headlineMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ColorConstants.brown,
    ),
    headlineSmall: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: ColorConstants.brown,
    ),
    titleLarge: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorConstants.brown,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: ColorConstants.brown,
    ),
    titleSmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ColorConstants.brown,
    ),
    subtitle1: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstants.brown,
    ),
    labelLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.brown,
    ),
    labelMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorConstants.brown,
    ),
    labelSmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: ColorConstants.brown,
    ),
    bodyText1: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.brown,
    ),
    bodyText2: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.brown,
    ),
    caption: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ColorConstants.brown,
    ),
  ),
);
