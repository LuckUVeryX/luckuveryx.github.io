import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

enum ResponsiveLayout implements Comparable<ResponsiveLayout> {
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

  @override
  int compareTo(ResponsiveLayout other) => index - other.index;

  static ResponsiveLayout of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ResponsiveLayout.values.firstWhere(
      (e) => size.width <= e.value,
      orElse: () => ResponsiveLayout.values.first,
    );
  }

  static EdgeInsets paddingOf(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final target = of(context).value;
    return EdgeInsets.symmetric(
      horizontal: (max(0, width - target) ~/ 2) + 16.0,
    );
  }

  static TextStyle? displayStyleOf(BuildContext context) {
    final layout = of(context);
    return switch (layout) {
      ResponsiveLayout.xs => context.textTheme.displaySmall,
      ResponsiveLayout.sm => context.textTheme.displayMedium,
      _ => context.textTheme.displayLarge,
    };
  }

  static T? builderOf<T>(BuildContext context, Map<ResponsiveLayout, T> map) {
    final tree = SplayTreeMap<ResponsiveLayout, T>.from(map);
    final layout = of(context);
    if (map.containsKey(layout)) return tree[layout];
    return tree[tree.lastKeyBefore(layout)];
  }
}

/// [ResponsiveLayout] values referenced from
/// https://tailwindcss.com/docs/responsive-design
extension ResponsiveBreakpointX on ResponsiveLayout {
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
