import 'dart:collection';

import 'package:flutter/material.dart';

enum ResponsiveLayout implements Comparable<ResponsiveLayout> {
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

  @override
  int compareTo(ResponsiveLayout other) => index - other.index;

  static ResponsiveLayout of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ResponsiveLayout.values.firstWhere(
      (e) => e.value > size.width,
      orElse: () => ResponsiveLayout.values.last,
    );
  }

  static double paddingOf(BuildContext context) {
    return ResponsiveLayout.builderOf(context, {
          ResponsiveLayout.md: 32,
          ResponsiveLayout.lg: 64,
          ResponsiveLayout.xl: 128,
        }) ??
        16;
  }

  static T? builderOf<T>(BuildContext context, Map<ResponsiveLayout, T> map) {
    final tree = SplayTreeMap<ResponsiveLayout, T>.from(map);
    final layout = ResponsiveLayout.of(context);
    if (map.containsKey(layout)) return tree[layout];
    return tree[tree.lastKeyBefore(layout)];
  }
}

/// [ResponsiveLayout] values referenced from
/// https://tailwindcss.com/docs/responsive-design
extension ResponsiveBreakpointX on ResponsiveLayout {
  double get value {
    return switch (this) {
      ResponsiveLayout.sm => 640,
      ResponsiveLayout.md => 786,
      ResponsiveLayout.lg => 1024,
      ResponsiveLayout.xl => 1280,
      ResponsiveLayout.xxl => 1536
    };
  }
}
