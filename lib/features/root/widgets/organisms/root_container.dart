import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

Iterable<(double height, double value, Color color)> _useWaves() {
  final colorScheme = useContext().colorScheme;

  /// (height, speed, offset, color)
  final curves = [
    (80.0, 0.5, -pi * 2, colorScheme.primary),
    (120.0, 1.0, -pi, colorScheme.primaryContainer),
    (160.0, 1.5, 0.0, colorScheme.secondary),
    (200.0, 1.0, pi, colorScheme.secondaryContainer),
    (240.0, 0.5, pi * 2, colorScheme.tertiary),
  ];

  return curves.map(
    (e) {
      final (height, speed, offset, color) = e;

      final controller = useAnimationController(
        duration: Duration(milliseconds: 5000 ~/ speed),
      );
      useEffect(
        () {
          controller.repeat();
          return null;
        },
        [],
      );

      final value = useAnimation(
            controller.drive(
              Tween(begin: 0, end: 2 * pi).chain(
                CurveTween(
                  curve: Curves.easeInOutSine,
                ),
              ),
            ),
          ) +
          offset;
      return (height, value, color.withOpacity(0.1));
    },
  );
}

class RootContainer extends HookWidget {
  const RootContainer({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final waves = _useWaves();

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.onBackground,
        ),
      ),
      margin: const EdgeInsets.all(28).copyWith(left: 0),
      child: Stack(
        children: [
          for (final (height, value, color) in waves)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: double.infinity,
                height: height,
                child: CustomPaint(
                  painter: CurvePainter(
                    value: value,
                    color: color,
                  ),
                ),
              ),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
