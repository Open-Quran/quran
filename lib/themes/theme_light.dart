import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

/// Light Theme
final ThemeData themeLight = ThemeData(
  appBarTheme: _appBarTheme,
  bottomNavigationBarTheme: _bottomNavigationBarThemeData,
  tabBarTheme: _tabBarTheme,
  sliderTheme: _sliderThemeData,
  toggleButtonsTheme: _toggleButtonsThemeData,
  drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.white,
      scrimColor: Colors.transparent,
      elevation: 0),
  buttonTheme: const ButtonThemeData(buttonColor: AppColors.purple),
  indicatorColor: AppColors.purple,
  iconTheme: const IconThemeData(color: AppColors.purple),
  primaryColor: AppColors.purple,
  backgroundColor: AppColors.white,
  secondaryHeaderColor: AppColors.darkGrey.withOpacity(0.4),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppColors.white,
  cardTheme: const CardTheme(color: AppColors.purple),
  canvasColor: AppColors.purple,
  dividerColor: AppColors.purple.withOpacity(0.2),
  fontFamily: Fonts.nunito,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: AppColors.purple,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.purple,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: AppColors.purple,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.purple,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.darkGrey,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: AppColors.purple,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.purple,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGrey,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGrey,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: AppColors.purple,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.purple,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGrey,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGrey,
    ),
  ),
);

/// [AppBarTheme] AppBar Theme
AppBarTheme get _appBarTheme {
  return AppBarTheme(
    backgroundColor: AppColors.white,
    titleTextStyle: TextStyle(
      color: AppColors.purple,
      fontSize: 20,
      fontFamily: Fonts.nunitoW900,
      fontWeight: FontWeight.w900,
    ),
    elevation: 0,
    iconTheme: const IconThemeData(
      color: AppColors.purple,
    ),
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
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: Fonts.nunito,
      ),
      color: AppColors.purple.withOpacity(0.1),
      selectedColor: AppColors.purple,
      disabledColor: AppColors.purple.withOpacity(0.1));
}

/// [BottomNavigationBarThemeData] Bottom Navigation Bar Theme Data
BottomNavigationBarThemeData get _bottomNavigationBarThemeData {
  return const BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    elevation: 0,
    selectedItemColor: AppColors.purple,
    unselectedItemColor: AppColors.purple,
  );
}

/// [TabBarTheme] Tab Bar Theme Data
TabBarTheme get _tabBarTheme {
  return const TabBarTheme(
    labelStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.purple),
  );
}
