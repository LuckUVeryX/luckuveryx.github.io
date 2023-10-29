import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/screen_saver/screen_saver.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class ScreenSaver extends HookConsumerWidget {
  const ScreenSaver({
    required this.size,
    required this.speed,
    required this.constraints,
    super.key,
  });

  final double size;
  final double speed;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pos = useState<(double x, double y)>(
      (
        Random().nextDouble() * (constraints.maxHeight - size),
        Random().nextDouble() * (constraints.maxWidth - size)
      ),
    );
    final dir = useState<(int dx, int dy)>(
      (
        Random().nextBool() ? 1 : -1,
        Random().nextBool() ? 1 : -1,
      ),
    );
    final (x, y) = pos.value;
    final tickerProvider = useTickerProvider();
    var (dx, dy) = dir.value;

    useEffect(
      () {
        final ticker = tickerProvider.createTicker((elapsed) {
          // Tick
          final (posX, posY) = pos.value;
          final (width, height) = (constraints.maxWidth, constraints.maxHeight);
          if (posX < 0) dx = 1;
          if (posX + size > width) dx = -1;
          if (posY < 0) dy = 1;
          if (posY + size > height) dy = -1;
          dir.value = (dx, dy);

          pos.value = (posX + dx * speed, posY + dy * speed);
        })
          ..start();
        return ticker.dispose;
      },
      [constraints, size, speed],
    );

    return Positioned(
      left: x,
      top: y,
      child: Container(
        height: size,
        width: size,
        color: context.colorScheme.primary,
      ),
    );
  }
}
