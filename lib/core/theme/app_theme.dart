import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightMain,
      onPrimary: AppColors.lightInputs,
      secondary: AppColors.lightMainText,
      onSecondary: AppColors.lightInputs,
      error: AppColors.lightRed,
      onError: AppColors.lightInputs,
      surface: AppColors.lightBackground,
      onSurface: const Color.fromARGB(255, 78, 9, 9),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightInputs,
      selectedItemColor: AppColors.lightMain,
      unselectedItemColor: AppColors.lightSecText,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightMainText,
      elevation: 0,
      centerTitle: true,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.lightMain,
        foregroundColor: AppColors.lightInputs,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightMain,
        side: BorderSide(width: 1, color: AppColors.lightMain),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14,
          color: AppColors.lightMain,
          decoration: TextDecoration.underline,
        )
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightMain,
      foregroundColor: AppColors.lightBackground,
      elevation: 4,
      shape: CircleBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightInputs,
        foregroundColor: AppColors.lightMain,
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: BorderSide(width: 1, color: AppColors.lightStroke),
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.lightSecText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.lightSecText,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.lightSecText,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightInputs,
      filled: true,
      contentPadding: EdgeInsets.all(16),
      hintStyle: TextStyle(fontSize: 14,color: AppColors.lightSecText),
      prefixIconColor: AppColors.lightDisable,
      suffixIconColor: AppColors.lightDisable,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightStroke),
        borderRadius: BorderRadius.circular(16),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightStroke),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightStroke),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightRed),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightRed),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkMain,         // #457AED
      onPrimary: AppColors.darkMainText,    // #FFFFFF
      secondary: AppColors.darkMainText,    // #FFFFFF
      onSecondary: AppColors.darkBackground, // #000F30
      error: AppColors.darkRed,            // #FF3232
      onError: AppColors.darkMainText,
      surface: AppColors.darkBackground,   // #000F30
      onSurface: AppColors.darkMainText,
      outline: AppColors.darkStroke,       // #002D8F
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkInputs,
      selectedItemColor: AppColors.darkMain,
      unselectedItemColor: AppColors.darkSecText,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkMainText,
      elevation: 0,
      centerTitle: true,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.darkMain,
        foregroundColor: AppColors.darkMainText,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.darkMain,
        side: BorderSide(width: 1, color: AppColors.darkMain),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
            textStyle: TextStyle(
              fontSize: 14,
              color: AppColors.darkMain,
              decoration: TextDecoration.underline,
              
            )
        )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkMain,
      foregroundColor: AppColors.darkMainText,
      elevation: 4,
      shape: CircleBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkInputs,
          foregroundColor: AppColors.darkMain,
          padding: EdgeInsets.all(16),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          side: BorderSide(width: 1, color: AppColors.darkStroke),
        )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.darkMainText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.darkMainText,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.darkMainText,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkInputs,
      filled: true,
      contentPadding: EdgeInsets.all(16),
      hintStyle: TextStyle(fontSize: 14,color: AppColors.darkSecText),
      prefixIconColor: AppColors.darkDisable,
      suffixIconColor: AppColors.darkDisable,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkStroke),
        borderRadius: BorderRadius.circular(16),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkStroke),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkStroke),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkRed),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkRed),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
