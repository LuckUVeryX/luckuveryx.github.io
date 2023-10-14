import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final theme = FlexThemeData.light(
      useMaterial3: true,
      scheme: FlexScheme.deepBlue,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
    final textTheme = theme.textTheme;
    return theme.copyWith(
      textTheme: textTheme.copyWith(
        displayLarge:
            textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData dark() {
    final theme = FlexThemeData.dark(
      useMaterial3: true,
      scheme: FlexScheme.deepBlue,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
    final textTheme = theme.textTheme;
    return theme.copyWith(
      textTheme: textTheme.copyWith(
        displayLarge:
            textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
