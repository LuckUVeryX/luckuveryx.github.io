import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return FlexThemeData.light(
      useMaterial3: true,
      scheme: FlexScheme.deepBlue,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
  }

  static ThemeData dark() {
    return FlexThemeData.dark(
      useMaterial3: true,
      scheme: FlexScheme.deepBlue,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
  }
}
