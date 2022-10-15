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
    iconTheme: const IconThemeData(
      color: ColorConstants.purple,
    ),
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
  drawerTheme: const DrawerThemeData(
    backgroundColor: ColorConstants.white,
    scrimColor: Colors.transparent,
    elevation: 0
  ),
  secondaryHeaderColor: ColorConstants.darkGrey.withOpacity(0.4),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: ColorConstants.white,
  cardTheme: const CardTheme(color: ColorConstants.purple),
  canvasColor: ColorConstants.purple,
  dividerColor: ColorConstants.purple.withOpacity(0.2),
  fontFamily: Fonts.nunito,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorConstants.white,
    elevation: 0,
    selectedItemColor: ColorConstants.purple,
    unselectedItemColor: ColorConstants.purple,
  ),
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ColorConstants.purple),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: ColorConstants.purple,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ColorConstants.purple,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: ColorConstants.purple,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: ColorConstants.purple,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorConstants.darkGrey,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: ColorConstants.purple,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ColorConstants.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstants.purple,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.darkGrey,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorConstants.darkGrey,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: ColorConstants.purple,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.purple,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.darkGrey,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ColorConstants.darkGrey,
    ),
  ),
);
