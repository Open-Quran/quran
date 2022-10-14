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
    iconTheme: const IconThemeData(
      color: ColorConstants.green,
    ),
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
  drawerTheme: const DrawerThemeData(
      backgroundColor: ColorConstants.paleYellow,
      scrimColor: Colors.transparent,
      elevation: 0
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
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: ColorConstants.green,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ColorConstants.green,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: ColorConstants.green,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: ColorConstants.green,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorConstants.green,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: ColorConstants.green,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ColorConstants.green,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstants.green,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.green,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorConstants.green,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: ColorConstants.green,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.green,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.green,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ColorConstants.green,
    ),
  ),
);
