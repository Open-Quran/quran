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
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      color: ColorConstants.white,
    ),
    headline2: TextStyle(
      fontSize: 28,
      color: ColorConstants.white,
    ),
    headline3: TextStyle(
      fontSize: 26,
      color: ColorConstants.white,
    ),
    headline4: TextStyle(
      fontSize: 24,
      color: ColorConstants.white,
    ),
    headline5: TextStyle(
      fontSize: 22,
      color: ColorConstants.white,
    ),
    subtitle1: TextStyle(
      color: ColorConstants.white,
      fontSize: 20,
    ),
    subtitle2: TextStyle(
      fontSize: 18,
      color: ColorConstants.white,
    ),
    bodyText1: TextStyle(
      color: ColorConstants.white,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: ColorConstants.white,
      fontSize: 14,
    ),
    caption: TextStyle(
      fontSize: 12,
      color: ColorConstants.white,
    ),
  ),
);
