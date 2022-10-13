import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

/// Dark Theme
final ThemeData themeDark = ThemeData(
  primaryColor: ColorConstants.darkGrey,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.darkGrey,
    titleTextStyle: TextStyle(
      color: ColorConstants.white,
      fontSize: 20,
      fontFamily: Fonts.nunitoW900,
      fontWeight: FontWeight.w900,
    ),
    elevation: 0,
  ),
  indicatorColor: ColorConstants.darkGrey,
  iconTheme: const IconThemeData(color: ColorConstants.white),
  backgroundColor: ColorConstants.darkGrey,
  sliderTheme: const SliderThemeData(
    trackHeight: 2,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 0,
    ),
  ),
  secondaryHeaderColor: ColorConstants.white.withOpacity(0.4),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: ColorConstants.darkGrey,
  cardTheme: CardTheme(color: ColorConstants.white.withOpacity(0.1)),
  canvasColor: ColorConstants.white,
  dividerColor: ColorConstants.white.withOpacity(0.2),
  fontFamily: Fonts.nunito,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorConstants.darkGrey,
    elevation: 0,
    selectedItemColor: ColorConstants.white,
    unselectedItemColor: ColorConstants.white,
  ),
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ColorConstants.white),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: ColorConstants.white,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ColorConstants.white,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: ColorConstants.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: ColorConstants.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorConstants.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: ColorConstants.white,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ColorConstants.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstants.white,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorConstants.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: ColorConstants.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.white,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.white,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ColorConstants.white,
    ),
  ),
);
