import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  

ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  textTheme: _textTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.primary,
    // titleTextStyle: headingTextStyle.copyWith(fontSize: 20),
    iconTheme: IconThemeData(color: darkColorScheme.onPrimary),
  ),
  // cardTheme: cardTheme,
  // buttonTheme: buttonTheme,
  scaffoldBackgroundColor: darkColorScheme.background,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColorScheme.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: darkColorScheme.secondaryContainer,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      // borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: darkColorScheme.tertiary),
    labelStyle: TextStyle(color: darkColorScheme.tertiary),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkColorScheme.primary,
    selectedItemColor: darkColorScheme.onPrimary,
    unselectedItemColor: darkColorScheme.tertiary,
  ),
);



   static const ColorScheme darkColorScheme = ColorScheme(

   primary: Color(0xFFFFFFFF),
  primaryContainer: Color.fromRGBO(15, 25, 34, 1),
  secondary: Color(0xFF232327),
  secondaryContainer: Color(0xFF451B6F),
  tertiary: Color(0xFFE1E1E1),
  surface: Color(0xFF232327),  // Background for cards, lists, etc.
  error: Color(0xFFB00020),
  onPrimary: Colors.white,  // Text color on primary elements
  onSecondary: Colors.white,  // Text color on secondary elements
  onSurface: Colors.black,  // Text color on surfaces like cards
  onError: Colors.white,  // Text color for errors
  background: Color(0xFF424242),
  brightness: Brightness.dark,

  );

   ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  textTheme: _textTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.primary,
    // titleTextStyle: headingTextStyle.copyWith(fontSize: 20),
    iconTheme: IconThemeData(color: darkColorScheme.onPrimary),
  ),
  // cardTheme: cardTheme,
  // buttonTheme: buttonTheme,
  scaffoldBackgroundColor: lightColorScheme.background,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColorScheme.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: darkColorScheme.secondaryContainer,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      // borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: darkColorScheme.tertiary),
    labelStyle: TextStyle(color: darkColorScheme.tertiary),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkColorScheme.primary,
    selectedItemColor: darkColorScheme.onPrimary,
    unselectedItemColor: darkColorScheme.tertiary,
  ),
);





   static const ColorScheme lightColorScheme = ColorScheme(

   primary: Color(0xFF1E2E3B),
  primaryContainer: Color.fromRGBO(15, 25, 34, 1),
  secondary: Color(0xFF232327),
  secondaryContainer: Color(0xFF451B6F),
  tertiary: Color(0xFFE1E1E1),
  surface: Color(0xFFC4C4C4),  // Background for cards, lists, etc.
  background: Color(0xFF5B5858),  // General background color
  error: Color(0xFFB00020),
  onPrimary: Colors.white,  // Text color on primary elements
  onSecondary: Colors.white,  // Text color on secondary elements
  onSurface: Colors.white,  // Text color on surfaces like cards
  onBackground: Colors.white,  // Text color for background
  onError: Colors.white,  // Text color for errors
  brightness: Brightness.dark,

  );
  
  

  // Font weights
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  // Text theme for the app
  static final TextTheme _textTheme = TextTheme(
    headlineMedium: GoogleFonts.lato(fontWeight: _bold, fontSize: 20.0),
    bodySmall: GoogleFonts.lato(fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: GoogleFonts.lato(fontWeight: _medium, fontSize: 16.0),
    titleMedium: GoogleFonts.lato(fontWeight: _medium, fontSize: 16.0),
    labelSmall: GoogleFonts.lato(fontWeight: _medium, fontSize: 10.0),
    bodyLarge: GoogleFonts.lato(fontWeight: _regular, fontSize: 14.0),
    titleSmall: GoogleFonts.lato(fontWeight: _medium, fontSize: 14.0),
    bodyMedium: GoogleFonts.lato(fontWeight: _regular, fontSize: 16.0),
    titleLarge: GoogleFonts.lato(fontWeight: _regular, fontSize: 24.0),
    labelLarge: GoogleFonts.lato(fontWeight: _semiBold, fontSize: 14.0),
    labelMedium: GoogleFonts.lato(fontWeight: _regular, fontSize: 12.0),
  );
}
