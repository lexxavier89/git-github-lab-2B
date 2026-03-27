import 'package:flutter/material.dart';

class AdoTheme {
  // ── Palette ────────────────────────────────────────────────────────────
  static const Color bg      = Color(0xFF090C14); // near-black
  static const Color surface = Color(0xFF111827); // dark navy
  static const Color card    = Color(0xFF1C2333); // card bg
  static const Color accent  = Color(0xFF4D9FFF); // electric blue
  static const Color accent2 = Color(0xFF1E5FAA); // darker blue
  static const Color white   = Color(0xFFE8EDF5); // soft white

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: const ColorScheme.dark(
          background: bg,
          surface: surface,
          primary: accent,
          secondary: accent2,
          onBackground: white,
          onSurface: white,
          onPrimary: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: surface,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: const TextStyle(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
          iconTheme: const IconThemeData(color: accent),
        ),
        cardTheme: CardTheme(
          color: card,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: accent.withOpacity(0.15)),
          ),
        ),
        dividerColor: accent.withOpacity(0.15),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: white, fontSize: 28, fontWeight: FontWeight.bold),
          titleLarge:
              TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w600),
          titleMedium:
              TextStyle(color: white, fontSize: 15, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(color: white, fontSize: 14),
          bodyMedium: TextStyle(color: Colors.white70, fontSize: 13),
          labelSmall: TextStyle(color: Colors.white38, fontSize: 11),
        ),
      );
}
