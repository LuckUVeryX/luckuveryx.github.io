import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

enum ResponsiveLayout {
  /// Skinny
  ///
  /// `320`
  xs,

  /// Mobile
  ///
  /// `640`
  sm,

  /// Mobile Large
  ///
  /// `786`
  md,

  /// Tablet
  ///
  /// `1024`
  lg,

  /// Desktop
  ///
  /// `1280`
  xl,

  /// WideScreen
  ///
  /// `1536`
  xxl;

  static ResponsiveLayout of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ResponsiveLayout.values.firstWhere(
      (e) => size.width <= e.value,
      orElse: () => ResponsiveLayout.values.last,
    );
  }

  static TextStyle? _displayStyleOf(BuildContext context) {
    switch (of(context)) {
      case ResponsiveLayout.xs:
      case ResponsiveLayout.sm:
        return context.textTheme.displaySmall;
      case ResponsiveLayout.md:
      case ResponsiveLayout.lg:
        return context.textTheme.displayMedium;
      case ResponsiveLayout.xl:
      case ResponsiveLayout.xxl:
        return context.textTheme.displayLarge;
    }
  }

  static TextStyle? _titleStyleOf(BuildContext context) {
    switch (of(context)) {
      case ResponsiveLayout.xs:
      case ResponsiveLayout.sm:
        return context.textTheme.titleSmall;
      case ResponsiveLayout.md:
      case ResponsiveLayout.lg:
        return context.textTheme.titleMedium;
      case ResponsiveLayout.xl:
      case ResponsiveLayout.xxl:
        return context.textTheme.titleLarge;
    }
  }

  static TextStyle? _bodyStyleOf(BuildContext context) {
    switch (of(context)) {
      case ResponsiveLayout.xs:
      case ResponsiveLayout.sm:
        return context.textTheme.bodySmall;
      case ResponsiveLayout.md:
      case ResponsiveLayout.lg:
        return context.textTheme.bodyMedium;
      case ResponsiveLayout.xl:
      case ResponsiveLayout.xxl:
        return context.textTheme.bodyLarge;
    }
  }

  static TextStyle? _labelStyleOf(BuildContext context) {
    switch (of(context)) {
      case ResponsiveLayout.xs:
      case ResponsiveLayout.sm:
        return context.textTheme.labelSmall;
      case ResponsiveLayout.md:
      case ResponsiveLayout.lg:
        return context.textTheme.labelMedium;
      case ResponsiveLayout.xl:
      case ResponsiveLayout.xxl:
        return context.textTheme.labelLarge;
    }
  }
}

/// [ResponsiveLayout] values referenced from
/// https://tailwindcss.com/docs/responsive-design
extension ResponsiveLayoutX on ResponsiveLayout {
  double get value {
    return switch (this) {
      ResponsiveLayout.xs => 320,
      ResponsiveLayout.sm => 640,
      ResponsiveLayout.md => 786,
      ResponsiveLayout.lg => 1024,
      ResponsiveLayout.xl => 1280,
      ResponsiveLayout.xxl => 1536
    };
  }
}

extension ResponsiveContextX on BuildContext {
  TextStyle? get displayStyle => ResponsiveLayout._displayStyleOf(this);
  TextStyle? get titleStyle => ResponsiveLayout._titleStyleOf(this);
  TextStyle? get bodyStyle => ResponsiveLayout._bodyStyleOf(this);
  TextStyle? get labelStyle => ResponsiveLayout._labelStyleOf(this);
}
