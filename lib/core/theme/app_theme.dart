import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

ThemeData lightMode = ThemeData(
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    modalBackgroundColor: Colors.transparent,
  ),
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.roboto(
        fontSize: AppFontSize.s18, color: AppColors.subtitleTextColor),
    bodyMedium: GoogleFonts.roboto(
      color: AppColors.subtitleTextColor,
      fontSize: AppFontSize.s16,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: GoogleFonts.roboto(
      color: AppColors.subtitleTextColor,
      fontSize: AppFontSize.s16,
    ),
    labelMedium: GoogleFonts.roboto(
      color: AppColors.textColorButton,
      fontSize: AppFontSize.s16,
    ),
    titleLarge: GoogleFonts.roboto(
      color: AppColors.titleTextColor,
      fontSize: AppFontSize.s16,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: GoogleFonts.roboto(
      color: AppColors.titleTextColor,
      fontSize: AppFontSize.s12,
    ),
    titleMedium: GoogleFonts.roboto(
      color: AppColors.titleTextColor,
      fontSize: AppFontSize.s14,
    ),
  ),

  iconTheme: IconThemeData(
    color: AppColors.iconColorBlack,
    size: 22,
  ),

  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  primaryColor: AppColors.primaryColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.iconColorBlack,
    unselectedItemColor: AppColors.iconColorBlack,
    showUnselectedLabels: false,
    showSelectedLabels: false,
    elevation: AppElevation.eL4,
    backgroundColor: AppColors.navBarBackgroundColor,
  ),
  //  backgroundColor: Color(0xffF6F9F4),
);
