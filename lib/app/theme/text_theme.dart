import 'package:flutter/material.dart';

import 'colors.dart';

const FontWeight regular = FontWeight.w400;
const FontWeight semiBold = FontWeight.w600;

TextTheme getKhmerTextTheme({required bool isDarkMode}) {
  return TextTheme(
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
      letterSpacing: 0,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkSurface : MyAppColors.text,
    ),
  );
}

TextTheme getEnglishTextTheme({required bool isDarkMode}) {
  return TextTheme(
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: semiBold,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: semiBold,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: semiBold,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: semiBold,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: semiBold,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: semiBold,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: semiBold,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
      letterSpacing: 0,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkText : MyAppColors.text,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: regular,
      color: isDarkMode ? MyAppColors.darkSurface : MyAppColors.text,
    ),
  );
}

TextStyle getAppbarTextStyle() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: semiBold,
    color: MyAppColors.white,
  );
}

TextStyle getTabSelectedTextStyle({
  required bool isDarkMode,
}) {
  return TextStyle(
    fontSize: 18,
    fontWeight: semiBold,
    color: isDarkMode ? MyAppColors.primaryDark : MyAppColors.primaryColor,
  );
}

TextStyle getTabUnselectedTextStyle({
  required bool isDarkMode,
}) {
  return TextStyle(
    fontSize: 18,
    fontWeight: semiBold,
    color: isDarkMode ? MyAppColors.hint : MyAppColors.darkHint,
  );
}
