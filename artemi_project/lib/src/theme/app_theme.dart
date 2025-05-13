import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'palette.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Palette.artGold,

      // TextField
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Palette.textColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: const Color(0xC3FFFFFF), width: 2),
        ),
        hintStyle: TextStyle(color: Palette.textColor),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Palette.artGold,
      ),

      // Text
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
          headlineLarge: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white,
          ),
          labelMedium: GoogleFonts.poppins(
            color: Palette.textColor,
          ),
          titleSmall: GoogleFonts.poppins(color: Palette.artGold)),

      // Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.artGold,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
