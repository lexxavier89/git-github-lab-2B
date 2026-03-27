import 'package:flutter/material.dart';

class AppTheme {
  static const Color red = Color(0xFFD32F2F);
  static const Color darkRed = Color(0xFF8B0000);
  static const Color black = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color white = Color(0xFFF5F5F5);

  static ThemeData get theme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: red,
        scaffoldBackgroundColor: black,
        colorScheme: const ColorScheme.dark(
          primary: red,
          secondary: darkRed,
          surface: surface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: darkRed,
          foregroundColor: white,
          elevation: 4,
          titleTextStyle: TextStyle(
            color: white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: surface,
          selectedItemColor: red,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF1A1A1A),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: red,
          foregroundColor: white,
        ),
      );
}
