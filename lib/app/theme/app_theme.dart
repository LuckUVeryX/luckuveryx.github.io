import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static const _light = Color(0xFFEEEEEE);
  static const _dark = Color(0xFF333333);

  /// #EEEEEE
  static final Map<int, Color> _lightSwatch = {
    50: const Color.fromRGBO(238, 238, 238, .1),
    100: const Color.fromRGBO(238, 238, 238, .2),
    200: const Color.fromRGBO(238, 238, 238, .3),
    300: const Color.fromRGBO(238, 238, 238, .4),
    400: const Color.fromRGBO(238, 238, 238, .5),
    500: const Color.fromRGBO(238, 238, 238, .6),
    600: const Color.fromRGBO(238, 238, 238, .7),
    700: const Color.fromRGBO(238, 238, 238, .8),
    800: const Color.fromRGBO(238, 238, 238, .9),
    900: const Color.fromRGBO(238, 238, 238, 1),
  };

  /// #333333
  static final Map<int, Color> _darkSwatch = {
    50: const Color.fromRGBO(51, 51, 51, .1),
    100: const Color.fromRGBO(51, 51, 51, .2),
    200: const Color.fromRGBO(51, 51, 51, .3),
    300: const Color.fromRGBO(51, 51, 51, .4),
    400: const Color.fromRGBO(51, 51, 51, .5),
    500: const Color.fromRGBO(51, 51, 51, .6),
    600: const Color.fromRGBO(51, 51, 51, .7),
    700: const Color.fromRGBO(51, 51, 51, .8),
    800: const Color.fromRGBO(51, 51, 51, .9),
    900: const Color.fromRGBO(51, 51, 51, 1),
  };

  static final _materialLight = MaterialColor(_light.value, _lightSwatch);
  static final _materialDark = MaterialColor(_dark.value, _darkSwatch);

  static ThemeData light() {
    final theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: _materialDark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.light(
        secondaryContainer: Colors.grey,
        primary: _materialDark,
        surface: _materialLight,
        background: _materialLight,
        surfaceVariant: _materialLight,
        onSurface: _dark,
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          for (final platform in TargetPlatform.values)
            platform: const FadeTransitionBuilder(),
        },
      ),
    );

    final textTheme = theme.textTheme;
    return theme.copyWith(
      textTheme: GoogleFonts.ralewayTextTheme(textTheme),
    );
  }

  static ThemeData dark() {
    final theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: _materialLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.dark(
        primary: _materialLight,
        secondary: Colors.grey,
        tertiary: Colors.grey,
        onBackground: _light.withOpacity(0.95),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          for (final platform in TargetPlatform.values)
            platform: const FadeTransitionBuilder(),
        },
      ),
    );

    final textTheme = theme.textTheme;
    return theme.copyWith(
      textTheme: GoogleFonts.ralewayTextTheme(textTheme),
    );
  }
}

class FadeTransitionBuilder extends PageTransitionsBuilder {
  const FadeTransitionBuilder();

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
