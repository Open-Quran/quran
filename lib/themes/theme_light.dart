import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

/// Light Theme
final ThemeData themeLight = ThemeData(
  primaryColor: ColorConstants.purple,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.white,
    titleTextStyle: TextStyle(
      color: ColorConstants.purple,
      fontSize: 20,
      fontFamily: Fonts.nunitoW900,
      fontWeight: FontWeight.w900,
    ),
    elevation: 0,
  ),
  indicatorColor: ColorConstants.purple,
  iconTheme: const IconThemeData(color: ColorConstants.purple),
  backgroundColor: ColorConstants.white,
  sliderTheme: const SliderThemeData(
    trackHeight: 2,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 0,
    ),
  ),
  secondaryHeaderColor: ColorConstants.darkGrey.withOpacity(0.4),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: ColorConstants.white,
  cardTheme: const CardTheme(color: ColorConstants.purple),
  canvasColor: ColorConstants.green,
  dividerColor: ColorConstants.purple.withOpacity(0.2),
  fontFamily: Fonts.nunito,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorConstants.white,
    elevation: 0,
    selectedItemColor: ColorConstants.purple,
    unselectedItemColor: ColorConstants.purple,
  ),
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ColorConstants.purple),
  ),
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: ColorConstants.purple,
    ),
    headlineMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ColorConstants.purple,
    ),
    headlineSmall: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: ColorConstants.purple,
    ),
    titleLarge: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorConstants.darkGrey,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: ColorConstants.purple,
    ),
    titleSmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ColorConstants.white,
    ),
    subtitle1: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstants.purple,
    ),
    labelLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.darkGrey,
    ),
    labelMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorConstants.darkGrey,
    ),
    labelSmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: ColorConstants.purple,
    ),
    bodyText1: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.purple,
    ),
    bodyText2: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.darkGrey,
    ),
    caption: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ColorConstants.darkGrey.withOpacity(0.5),
    ),
  ),
);
