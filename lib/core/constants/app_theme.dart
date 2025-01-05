import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    textTheme: _darkTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      iconTheme: IconThemeData(color: darkColorScheme.primary),
    ),
    scaffoldBackgroundColor: darkColorScheme.background,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkColorScheme.primary,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(darkColorScheme.primary),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkColorScheme.secondaryContainer,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: TextStyle(color: darkColorScheme.tertiary),
      labelStyle: TextStyle(color: darkColorScheme.tertiary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.primary,
      selectedItemColor: darkColorScheme.primary,
      unselectedItemColor: darkColorScheme.tertiary,
    ),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFFFFFF),
    primaryContainer: Color.fromRGBO(15, 25, 34, 1),
    secondary: Color(0xFF232327),
    secondaryContainer: Color(0xFF451B6F),
    tertiary: Color(0xFFE1E1E1),
    surface: Color(0xFF232327),
    error: Color(0xFFB00020),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    background: Color(0xFF424242),
    brightness: Brightness.dark,
  );

  ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: _lightTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.primary,
      iconTheme: IconThemeData(color: lightColorScheme.primary),
    ),
    scaffoldBackgroundColor: lightColorScheme.background,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightColorScheme.primary,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(lightColorScheme.primary),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightColorScheme.secondaryContainer,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: TextStyle(color: lightColorScheme.tertiary),
      labelStyle: TextStyle(color: lightColorScheme.tertiary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColorScheme.primary,
      selectedItemColor: lightColorScheme.primary,
      unselectedItemColor: lightColorScheme.tertiary,
    ),
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF1E2E3B),
    primaryContainer: Color.fromRGBO(15, 25, 34, 1),
    secondary: Color(0xFF232327),
    secondaryContainer: Color(0xFF451B6F),
    tertiary: Color(0xFFE1E1E1),
    surface: Color(0xFFC4C4C4),
    background: Color(0xFF5B5858),
    error: Color(0xFFB00020),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _lightTextTheme = TextTheme(
    headlineMedium: GoogleFonts.lato(
      fontWeight: _bold,
      fontSize: 24.0,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.lato(
      fontWeight: _semiBold,
      fontSize: 12.0,
      color: Colors.grey,
    ),
    headlineSmall: GoogleFonts.lato(
      fontWeight: _medium,
      fontSize: 20.0,
      color: Colors.blueGrey,
    ),
    titleMedium: GoogleFonts.lato(
      fontWeight: _medium,
      fontSize: 18.0,
      color: const Color(0xFFFFFFFF),
    ),
    labelSmall: GoogleFonts.lato(
      fontWeight: _medium,
      fontSize: 10.0,
      color: Colors.red,
    ),
    bodyLarge: GoogleFonts.lato(
      fontWeight: _regular,
      fontSize: 16.0,
      color: Colors.green,
    ),
    titleSmall: GoogleFonts.lato(
      fontWeight: _medium,
      fontSize: 14.0,
      color: Color(0xFFE1E1E1),
    ),
    bodyMedium: GoogleFonts.lato(
      fontWeight: _regular,
      fontSize: 14.0,
      color: Colors.orange,
    ),
    titleLarge: GoogleFonts.lato(
      fontWeight: _regular,
      fontSize: 28.0,
      color: Colors.pink,
    ),
    labelLarge: GoogleFonts.lato(
      fontWeight: _semiBold,
      fontSize: 14.0,
      color: Colors.indigo,
    ),
    labelMedium: GoogleFonts.lato(
      fontWeight: _regular,
      fontSize: 12.0,
      color: Colors.brown,
    ),
  );
  static final TextTheme _darkTextTheme = TextTheme(
    headlineMedium: GoogleFonts.lato(
      fontWeight: _bold,
      fontSize: 24.0,
      color: Color(0xFFFFFFF),
    ),
    bodySmall: GoogleFonts.lato(
      fontWeight: _semiBold,
      fontSize: 12.0,
      color: Colors.grey,
    ),
    headlineSmall: GoogleFonts.lato(
      fontWeight: _medium,
      fontSize: 20.0,
      color: Colors.blueGrey,
    ),
    titleMedium: GoogleFonts.lato(
      fontWeight: _medium,
      fontSize: 18.0,
      color: Colors.deepPurple,
    ),
    labelSmall: GoogleFonts.lato(
      fontWeight: _medium,
      fontSize: 10.0,
      color: Colors.red,
    ),
    bodyLarge: GoogleFonts.lato(
      fontWeight: _regular,
      fontSize: 16.0,
      color: Colors.green,
    ),
    titleSmall: GoogleFonts.lato(
      fontWeight: _medium,
      fontSize: 14.0,
      color: Colors.teal,
    ),
    bodyMedium: GoogleFonts.lato(
      fontWeight: _regular,
      fontSize: 14.0,
      color: Colors.orange,
    ),
    titleLarge: GoogleFonts.lato(
      fontWeight: _regular,
      fontSize: 28.0,
      color: Colors.pink,
    ),
    labelLarge: GoogleFonts.lato(
      fontWeight: _semiBold,
      fontSize: 14.0,
      color: Colors.indigo,
    ),
    labelMedium: GoogleFonts.lato(
      fontWeight: _regular,
      fontSize: 12.0,
      color: Colors.brown,
    ),
  );
}
