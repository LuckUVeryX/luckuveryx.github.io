import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return FlexThemeData.light(
      scheme: FlexScheme.deepBlue,
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return FlexThemeData.dark(
      scheme: FlexScheme.deepBlue,
      useMaterial3: true,
    );
  }
}
