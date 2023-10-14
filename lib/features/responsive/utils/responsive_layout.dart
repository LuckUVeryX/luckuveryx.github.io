import 'package:flutter/material.dart';

enum ResponsiveLayout {
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
      (e) => e.value > size.width,
      orElse: () => ResponsiveLayout.values.last,
    );
  }
}

/// [ResponsiveLayout] values referenced from
/// https://tailwindcss.com/docs/responsive-design
extension ResponsiveBreakpointX on ResponsiveLayout {
  int get value {
    return switch (this) {
      ResponsiveLayout.sm => 640,
      ResponsiveLayout.md => 786,
      ResponsiveLayout.lg => 1024,
      ResponsiveLayout.xl => 1280,
      ResponsiveLayout.xxl => 1536
    };
  }
}
