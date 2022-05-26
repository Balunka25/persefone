import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persefone/design/my_colors.dart';
ThemeData theme() {
  return ThemeData(
    // fontFamily: GoogleFonts.openSans().fontFamily,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 32,
        fontFamily: GoogleFonts.novaCut().fontFamily,
      ),
      headline2: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 24,
        fontFamily: GoogleFonts.novaCut().fontFamily,
      ),
      headline3: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 20,
        fontFamily: GoogleFonts.novaCut().fontFamily,
      ),
      headline4: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: GoogleFonts.novaCut().fontFamily,
      ),
      headline5: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: GoogleFonts.novaCut().fontFamily,
      ),
      headline6: TextStyle(
        color: MyColors.primarydark,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: GoogleFonts.novaCut().fontFamily,
      ),
    ),
  );
}