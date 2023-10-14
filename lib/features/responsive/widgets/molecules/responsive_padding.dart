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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: ResponsiveLayout.of(context).value,
      child: child,
    );
  }
}
