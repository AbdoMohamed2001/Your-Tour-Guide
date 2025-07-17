import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.orange),
    primarySwatch: Colors.orange,
    primaryColorDark: Colors.black,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white38,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffFFFFFF),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: GoogleFonts.cairoTextTheme(
      TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.orange),
    primarySwatch: Colors.orange,
    primaryColorDark: Colors.white,
    primaryColor: Colors.black,
    canvasColor: Colors.white38,
    textTheme: GoogleFonts.cairoTextTheme(
      TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    scaffoldBackgroundColor: Color(0xff121212),
    colorScheme: ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff121212),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff121212),
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff121212),
    ),
  );
}
