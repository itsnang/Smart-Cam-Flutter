import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:update_her/app/helper/constant.dart';
import 'package:update_her/app/theme/colors.dart';

import 'text_theme.dart';

ThemeData themeLight() {
  return ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: MyAppColors.appBarColor,
      foregroundColor: MyAppColors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MyAppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      titleTextStyle: getAppbarTextStyle(),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: MyAppColors.primaryColor,
      labelStyle: getTabSelectedTextStyle(
        isDarkMode: false,
      ),
      unselectedLabelStyle: getTabUnselectedTextStyle(
        isDarkMode: false,
      ),
    ),
    primaryColor: MyAppColors.primaryColor,
    primaryColorDark: MyAppColors.primaryDark,
    scaffoldBackgroundColor: MyAppColors.background,
    hintColor: MyAppColors.hint,
    disabledColor: MyAppColors.disabled.withOpacity(0.5),
    dividerColor: MyAppColors.divider,
    iconTheme: const IconThemeData(
      color: MyAppColors.icon,
    ),
    dividerTheme: const DividerThemeData(
      color: MyAppColors.divider,
      space: 0,
      thickness: 1,
    ),
    cardTheme: CardTheme(
      color: MyAppColors.cardColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: kCardShape,
    ),
    dialogBackgroundColor: MyAppColors.dialogBackground,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: MyAppColors.white,
      filled: true,
      errorMaxLines: 2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.divider,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.secondary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.error,
        ),
      ),
      errorStyle: const TextStyle(
        color: MyAppColors.error,
        fontSize: 14,
      ),
      hintStyle: const TextStyle(
        color: MyAppColors.hint,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      floatingLabelStyle: const TextStyle(
        color: MyAppColors.secondary,
      ),
    ),
    textTheme: getEnglishTextTheme(isDarkMode: false),
    colorScheme: const ColorScheme.light(
      primary: MyAppColors.primaryColor,
      secondary: MyAppColors.secondary,
      tertiary: MyAppColors.tertiary,
      error: MyAppColors.error,
      background: MyAppColors.background,
      onSecondary: MyAppColors.secondary,
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: MyAppColors.darkAppBarColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MyAppColors.darkAppBarColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      titleTextStyle: getAppbarTextStyle(),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: MyAppColors.primaryDark,
      labelStyle: getTabSelectedTextStyle(
        isDarkMode: false,
      ),
      unselectedLabelStyle: getTabUnselectedTextStyle(
        isDarkMode: false,
      ),
    ),
    primaryColor: MyAppColors.primaryColor,
    primaryColorDark: MyAppColors.primaryDark,
    scaffoldBackgroundColor: MyAppColors.darkBackground,
    hintColor: MyAppColors.darkHint,
    disabledColor: MyAppColors.darkDisabled.withOpacity(0.5),
    dividerColor: MyAppColors.darkDivider,
    iconTheme: const IconThemeData(
      color: MyAppColors.darkIcon,
    ),
    dividerTheme: DividerThemeData(
      color: MyAppColors.lightGray.withAlpha(100),
      space: 0,
      thickness: 1,
    ),
    cardTheme: CardTheme(
      color: MyAppColors.darkCardColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: kCardShape,
    ),
    dialogBackgroundColor: MyAppColors.darkDialogBackground,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: MyAppColors.darkCardColor,
      filled: true,
      errorMaxLines: 2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.darkDivider,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.darkCardColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.darkSecondary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.darkError,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.darkError,
        ),
      ),
      errorStyle: const TextStyle(
        color: MyAppColors.darkError,
        fontSize: 14,
      ),
      hintStyle: const TextStyle(
        color: MyAppColors.darkHint,
      ),
      labelStyle: const TextStyle(
        color: MyAppColors.darkText,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      floatingLabelStyle: const TextStyle(
        color: MyAppColors.darkSecondary,
      ),
    ),
    textTheme: getEnglishTextTheme(isDarkMode: true),
    colorScheme: const ColorScheme.dark(
      primary: MyAppColors.primaryColor,
      secondary: MyAppColors.darkSecondary,
      tertiary: MyAppColors.darkTertiary,
      error: MyAppColors.darkError,
      surface: MyAppColors.darkSurface,
      onSecondary: MyAppColors.white,
    ),
  );
}
