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
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      color: ColorConstants.brown,
    ),
    headline2: TextStyle(
      fontSize: 28,
      color: ColorConstants.brown,
    ),
    headline3: TextStyle(
      fontSize: 26,
      color: ColorConstants.brown,
    ),
    headline4: TextStyle(
      fontSize: 24,
      color: ColorConstants.brown,
    ),
    headline5: TextStyle(
      fontSize: 22,
      color: ColorConstants.brown,
    ),
    subtitle1: TextStyle(
      color: ColorConstants.brown,
      fontSize: 20,
    ),
    subtitle2: TextStyle(
      fontSize: 18,
      color: ColorConstants.brown,
    ),
    bodyText1: TextStyle(
      color: ColorConstants.brown,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: ColorConstants.brown,
      fontSize: 14,
    ),
    caption: TextStyle(
      fontSize: 12,
      color: ColorConstants.brown,
    ),
  ),
);
