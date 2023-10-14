import 'package:flutter/material.dart';
import 'package:luckuveryx/features/responsive/utils/responsive_layout.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    required this.desktop,
    required this.mobile,
    super.key,
  });

  final Widget desktop;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    late Widget child;
    final layout = ResponsiveLayout.of(context);
    switch (layout) {
      case ResponsiveLayout.sm:
      case ResponsiveLayout.md:
        child = mobile;
      case ResponsiveLayout.lg:
      case ResponsiveLayout.xl:
      case ResponsiveLayout.xxl:
        child = desktop;
    }
    return child;
  }
}
