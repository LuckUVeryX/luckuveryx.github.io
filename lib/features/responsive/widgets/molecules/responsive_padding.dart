import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';

class ResponsivePadding extends HookWidget {
  const ResponsivePadding({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final layout = ResponsiveLayout.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: switch (layout) {
        // For small layouts, only use padding.
        ResponsiveLayout.sm || ResponsiveLayout.xs => null,
        // Scope larger sizes to the next smallest layout width.
        _ => ResponsiveLayout.values[layout.index - 1].value,
      },
      child: child,
    );
  }
}
