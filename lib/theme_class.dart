import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_tour_guide/core/utils/app_colors.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Color(0xffFCFCFC),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffFCFCFC),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black,
      iconColor: Colors.black,
      selectedColor: Colors.white,
      selectedTileColor: Colors.orangeAccent,
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      horizontalTitleGap: 12,
    ),
    textTheme: GoogleFonts.cairoTextTheme().apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF7F7F7),
      errorMaxLines: 2,
      hintStyle: TextStyle(color: Colors.grey[600]),
      labelStyle: TextStyle(color: Colors.black87),
      suffixIconColor: AppColors.primaryColor,
      prefixIconColor: AppColors.primaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            BorderSide(color: AppColors.primaryColor.withValues(alpha: 153)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            BorderSide(color: AppColors.primaryColor.withValues(alpha: 153)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.orange),
    primarySwatch: Colors.orange,
    primaryColorDark: Colors.black,
    primaryColor: Colors.white,
    canvasColor: Colors.white70,
    cardColor: Color(0xFFF7F7F7),
  );
//---------------------------------------------------------------------------------
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Color(0xff121212),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff121212),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff121212),
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: GoogleFonts.cairoTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[850],
      errorMaxLines: 2,
      hintStyle: TextStyle(color: Colors.grey[400]),
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      suffixIconColor: AppColors.primaryColor,
      prefixIconColor: AppColors.primaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            BorderSide(color: AppColors.primaryColor.withValues(alpha: 153)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            BorderSide(color: AppColors.primaryColor.withValues(alpha: 153)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.white,
      iconColor: Colors.white,
      selectedColor: Colors.black,
      selectedTileColor: Colors.orange,
      tileColor: Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      horizontalTitleGap: 12,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.orange),
    primarySwatch: Colors.orange,
    primaryColorDark: Colors.white,
    primaryColor: Colors.black,
    canvasColor: Colors.white10,
    cardColor: Colors.grey[850],
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff121212),
    ),
  );
}
