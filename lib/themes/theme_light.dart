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
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      color: ColorConstants.purple,
    ),
    headline2: TextStyle(
      fontSize: 28,
      color: ColorConstants.purple,
    ),
    headline3: TextStyle(
      fontSize: 26,
      color: ColorConstants.purple,
    ),
    headline4: TextStyle(
      fontSize: 24,
      color: ColorConstants.purple,
    ),
    headline5: TextStyle(
      fontSize: 22,
      color: ColorConstants.purple,
    ),
    subtitle1: TextStyle(
      color: ColorConstants.purple,
      fontSize: 20,
    ),
    subtitle2: TextStyle(
      fontSize: 18,
      color: ColorConstants.purple,
    ),
    bodyText1: TextStyle(
      color: ColorConstants.purple,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: ColorConstants.purple,
      fontSize: 14,
    ),
    caption: TextStyle(
      fontSize: 12,
      color: ColorConstants.purple,
    ),
  ),
);
