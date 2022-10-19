import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

/// Dark Theme
final ThemeData themeDark = ThemeData(
  appBarTheme: _appBarTheme,
  bottomNavigationBarTheme: _bottomNavigationBarThemeData,
  tabBarTheme: _tabBarTheme,
  sliderTheme: _sliderThemeData,
  toggleButtonsTheme: _toggleButtonsThemeData,
  drawerTheme: _drawerThemeData,
  buttonTheme: const ButtonThemeData(buttonColor: AppColors.darkGrey),
  indicatorColor: AppColors.darkGrey,
  iconTheme: const IconThemeData(color: AppColors.white),
  primaryColor: AppColors.darkGrey,
  backgroundColor: AppColors.darkGrey,
  secondaryHeaderColor: AppColors.white.withOpacity(0.4),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppColors.darkGrey,
  cardTheme: CardTheme(color: AppColors.white.withOpacity(0.1)),
  canvasColor: AppColors.white,
  dividerColor: AppColors.white.withOpacity(0.2),
  fontFamily: Fonts.nunito,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: AppColors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: AppColors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: AppColors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: AppColors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
  ),
);

/// [AppBarTheme] AppBar Theme
AppBarTheme get _appBarTheme {
  return AppBarTheme(
    backgroundColor: AppColors.darkGrey,
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontFamily: Fonts.nunitoW900,
      fontWeight: FontWeight.w900,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    elevation: 0,
  );
}

/// [SliderThemeData] Slider Theme Data
SliderThemeData get _sliderThemeData {
  return const SliderThemeData(
    trackHeight: 2,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 0,
    ),
  );
}

/// [ToggleButtonsThemeData] Toggle Button Theme Data
ToggleButtonsThemeData get _toggleButtonsThemeData {
  return ToggleButtonsThemeData(
      textStyle: TextStyle(
        color: AppColors.darkGrey,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: Fonts.nunito,
      ),
      color: AppColors.lightGrey,
      selectedColor: AppColors.white,
      disabledColor: AppColors.lightGrey);
}

/// [BottomNavigationBarThemeData] Bottom Navigation Bar Theme Data
BottomNavigationBarThemeData get _bottomNavigationBarThemeData {
  return const BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkGrey,
    elevation: 0,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.white,
  );
}

/// [TabBarTheme] Tab Bar Theme Data
TabBarTheme get _tabBarTheme {
  return const TabBarTheme(
    labelStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white),
  );
}

/// [DrawerThemeData] Tab Bar Theme Data
DrawerThemeData get _drawerThemeData {
  return const DrawerThemeData(
      backgroundColor: AppColors.darkGrey,
      scrimColor: Colors.transparent,
      elevation: 0);
}
