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
        errorStyle: TextStyle(
          color: Palette.errorColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontStyle: FontStyle.italic,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Palette.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Palette.errorColor, width: 2),
        ),
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
          displayLarge: GoogleFonts.poppins(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          displayMedium: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          displaySmall: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          headlineSmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          headlineLarge: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w500,
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
