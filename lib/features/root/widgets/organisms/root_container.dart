import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

Iterable<(double height, double value)> _useWaves() {
  /// (height, speed, offset)
  const curves = [
    (160.0, 0.5, 0.0),
    (200.0, 1.0, pi),
    (240.0, 1.5, pi * 2),
  ];

  return curves.map(
    (e) {
      final (height, speed, offset) = e;

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

      final value =
          useAnimation(controller.drive(Tween(begin: 0, end: 2 * pi))) + offset;
      return (height, value);
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
          for (final (height, value) in waves)
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
                    color: context.colorScheme.onBackground.withOpacity(0.1),
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
