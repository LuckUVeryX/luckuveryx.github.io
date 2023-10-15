import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const values = ResponsiveLayout.values;
    final layout = ResponsiveLayout.of(context);
    // Aim for the layout to take the next smallest size.
    final layoutTargetIdx = layout.index - 1;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // Handle smallest size
      width: values[max(1, layoutTargetIdx) - 1].value,
      child: child,
    );
  }
}
