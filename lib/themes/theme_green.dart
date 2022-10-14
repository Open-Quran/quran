import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

/// Green Theme
final ThemeData themeGreen = ThemeData(
  appBarTheme:_appBarTheme,
  bottomNavigationBarTheme: _bottomNavigationBarThemeData,
  tabBarTheme: _tabBarTheme,
  sliderTheme: _sliderThemeData,
  toggleButtonsTheme: _toggleButtonsThemeData,
  indicatorColor: AppColors.green,
  iconTheme: const IconThemeData(color: AppColors.green),
  primaryColor: AppColors.paleYellow,
  backgroundColor: AppColors.paleYellow,
  secondaryHeaderColor: AppColors.green.withOpacity(0.4),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppColors.paleYellow,
  cardTheme: CardTheme(color: AppColors.green.withOpacity(0.1)),
  canvasColor: AppColors.green,
  dividerColor: AppColors.green.withOpacity(0.2),
  fontFamily: Fonts.nunito,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: AppColors.green,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.green,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: AppColors.green,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.green,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.green,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: AppColors.green,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.green,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.green,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.green,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.green,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: AppColors.green,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.green,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.green,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.green,
    ),
  ),
);

/// [AppBarTheme] AppBar Theme
AppBarTheme get _appBarTheme {
  return AppBarTheme(
    backgroundColor: AppColors.paleYellow,
    titleTextStyle: TextStyle(
      color: AppColors.green,
      fontSize: 20,
      fontFamily: Fonts.nunitoW900,
      fontWeight: FontWeight.w900,
    ),
    elevation: 0,
    iconTheme: const IconThemeData(
      color: AppColors.green,
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
      color: AppColors.green.withOpacity(0.1),
      selectedColor: AppColors.green,
      disabledColor: AppColors.lightGreen);
}

/// [BottomNavigationBarThemeData] Bottom Navigation Bar Theme Data
BottomNavigationBarThemeData get _bottomNavigationBarThemeData {
  return const BottomNavigationBarThemeData(
    backgroundColor: AppColors.paleYellow,
    elevation: 0,
    selectedItemColor: AppColors.green,
    unselectedItemColor: AppColors.green,
  );
}

/// [TabBarTheme] Tab Bar Theme Data
TabBarTheme get _tabBarTheme {
  return const TabBarTheme(
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.green),
  );
}
