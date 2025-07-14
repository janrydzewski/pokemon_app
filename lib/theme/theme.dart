import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color seed = Color(0xFFEE1515);
  static const Color primaryBlue = Color(0xFF3B4CCA);
  static const Color primaryYellow = Color(0xFFFFCB05);
  static const Color darkText = Color(0xFF2D2D2D);
  static const Color lightGray = Color(0xFFF2F2F2);
}

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.seed,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.quicksand().fontFamily,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.quicksand(
      fontSize: 48,
      fontWeight: FontWeight.w300,
      color: AppColors.darkText,
    ),
    headlineSmall: GoogleFonts.quicksand(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.darkText,
    ),
    titleLarge: GoogleFonts.quicksand(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText,
    ),
    titleMedium: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.darkText,
    ),
    bodyLarge: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.darkText,
    ),
    bodyMedium: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkText,
    ),
    bodySmall: GoogleFonts.quicksand(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColors.darkText,
    ),
    labelLarge: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText,
    ),
    labelSmall: GoogleFonts.quicksand(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.darkText,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.seed,
    foregroundColor: Colors.white,
    elevation: 2,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.seed,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: TextStyle(
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.all(8),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.lightGray,
    selectedColor: AppColors.primaryYellow,
    secondarySelectedColor: AppColors.primaryBlue,
    disabledColor: Colors.grey.shade300,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    labelStyle: TextStyle(
      fontFamily: GoogleFonts.quicksand().fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText,
    ),
    brightness: Brightness.light,
  ),
);
