import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants/colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: const Color(0xFF02499B),
      cardColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xFFF2F8FF),
      shadowColor: Colors.grey,
      dialogBackgroundColor: Colors.white,
      textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme.apply(
          bodyColor: PRIMARY_TEXT_COLOR, displayColor: PRIMARY_TEXT_COLOR)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF02499B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      )));
  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.grey[900],
      cardColor: const Color(0xFF022342),
      dialogBackgroundColor: Colors.grey[900],
      scaffoldBackgroundColor: const Color(0xFF032C52),
      shadowColor: Colors.grey,
      textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme.apply(
          bodyColor: const Color(0xFFB3C5EF),
          displayColor: const Color(0xFFB3C5EF))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF02499B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      )));
}
