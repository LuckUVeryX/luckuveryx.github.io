import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class RootBorder extends StatelessWidget {
  const RootBorder({
    this.child,
    super.key,
    this.margin = const EdgeInsets.all(28),
    this.padding = const EdgeInsets.all(24),
  });

  final Widget? child;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.onBackground,
        ),
      ),
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}
