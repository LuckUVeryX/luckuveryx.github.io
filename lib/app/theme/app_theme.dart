import 'package:flutter/material.dart';
import 'package:luckuveryx/gen/fonts.gen.dart';

class AppTheme {
  const AppTheme._();
  static const white = Color(0xFFEEEEEE);
  static const black = Color(0xFF121212);

  static ThemeData light() {
    final theme = ThemeData(
      useMaterial3: true,
      fontFamily: FontFamily.geistMono,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: white,
        onBackground: black,
      ),
    );

    return theme.copyWith(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          for (final platform in TargetPlatform.values)
            platform: const _FadeTransitionBuilder(),
        },
      ),
    );
  }

  static ThemeData dark() {
    final theme = ThemeData(
      useMaterial3: true,
      fontFamily: FontFamily.geistMono,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        onBackground: white,
      ),
    );

    return theme.copyWith(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          for (final platform in TargetPlatform.values)
            platform: const _FadeTransitionBuilder(),
        },
      ),
    );
  }
}

class _FadeTransitionBuilder extends PageTransitionsBuilder {
  const _FadeTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: FadeTransition(
        opacity: secondaryAnimation.drive(Tween(begin: 1, end: 0)),
        child: child,
      ),
    );
  }
}
