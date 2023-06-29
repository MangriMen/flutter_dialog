import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData createTheme() {
  ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: AppColors.primary);

  return ThemeData(
    fontFamily: AppTheme.fontFamily,
    colorScheme: colorScheme,
    primaryColor: AppColors.primary,
    textTheme: textTheme(),
    dropdownMenuTheme: dropdownMenuThemeData(),
    checkboxTheme: checkboxThemeData(),
    tabBarTheme: tabBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    elevatedButtonTheme: elevatedButtonThemeData(),
    outlinedButtonTheme: outlinedButtonThemeData(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    titleMedium: TextStyle(
      color: AppColors.text,
    ),
    titleLarge: TextStyle(
      color: AppColors.title,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  );
}

DropdownMenuThemeData dropdownMenuThemeData() {
  return const DropdownMenuThemeData(
    textStyle: TextStyle(
      fontSize: 14,
      color: AppColors.textDimmed,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.border,
        ),
      ),
    ),
  );
}

CheckboxThemeData checkboxThemeData() {
  return CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (!states.contains(MaterialState.selected)) {
          return AppColors.border;
        }
        return AppColors.primary;
      },
    ),
  );
}

TabBarTheme tabBarTheme() {
  const TextStyle labelStyle = TextStyle(
    color: AppColors.title,
    fontFamily: AppTheme.fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  return const TabBarTheme(
    labelColor: AppColors.text,
    labelStyle: labelStyle,
    unselectedLabelColor: AppColors.textDimmed,
    unselectedLabelStyle: labelStyle,
    indicatorSize: TabBarIndicatorSize.label,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 12),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.border,
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return const ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(TextStyle(
        fontWeight: FontWeight.w500,
      )),
      backgroundColor: MaterialStatePropertyAll(
        AppColors.primaryDarker,
      ),
    ),
  );
}

OutlinedButtonThemeData outlinedButtonThemeData() {
  return const OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(TextStyle(
        fontWeight: FontWeight.w500,
      )),
      foregroundColor: MaterialStatePropertyAll(AppColors.text),
    ),
  );
}
