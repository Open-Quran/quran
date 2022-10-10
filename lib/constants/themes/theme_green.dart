import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

/// Green Theme
final ThemeData themeGreen = ThemeData(
  primaryColor: ColorConstants.paleYellow,
  appBarTheme: const AppBarTheme(backgroundColor: ColorConstants.paleYellow, elevation: 0),
  iconTheme: const IconThemeData(color: ColorConstants.green),
  backgroundColor: ColorConstants.paleYellow,
  sliderTheme: const SliderThemeData(
    trackHeight: 2,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 0,
    ),
  ),
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
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      color: ColorConstants.green,
    ),
    headline2: TextStyle(
      fontSize: 28,
      color: ColorConstants.green,
    ),
    headline3: TextStyle(
      fontSize: 26,
      color: ColorConstants.green,
    ),
    headline4: TextStyle(
      fontSize: 24,
      color: ColorConstants.green,
    ),
    headline5: TextStyle(
      fontSize: 22,
      color: ColorConstants.green,
    ),
    subtitle1: TextStyle(
      color: ColorConstants.green,
      fontSize: 20,
    ),
    subtitle2: TextStyle(
      fontSize: 18,
      color: ColorConstants.green,
    ),
    bodyText1: TextStyle(
      color: ColorConstants.green,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: ColorConstants.green,
      fontSize: 14,
    ),
    caption: TextStyle(
      fontSize: 12,
      color: ColorConstants.green,
    ),
  ),
);
