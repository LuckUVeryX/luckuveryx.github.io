import 'package:flutter/material.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class RootContainer extends StatelessWidget {
  const RootContainer({this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacing.sp28,
            BrightnessButton(brightness: Brightness.dark),
            Spacing.sp12,
            BrightnessButton(brightness: Brightness.light),
          ],
        ),
        Expanded(child: BorderContainer(child: child)),
      ],
    );
  }
}
