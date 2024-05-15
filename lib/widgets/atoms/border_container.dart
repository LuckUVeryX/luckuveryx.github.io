import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.onSurface,
        ),
      ),
      child: child,
    );
  }
}
