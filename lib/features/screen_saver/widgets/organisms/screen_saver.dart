import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/screen_saver/screen_saver.dart';

class ScreenSaver extends HookConsumerWidget {
  const ScreenSaver({required this.constraints, super.key});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (:speed, :size) = ref.watch(screenSaverSettingsControllerProvider);

    final color = useState(
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withValues(alpha: 1),
    );
    final pos = useState<(double x, double y)>(
      (
        Random().nextDouble() * (constraints.maxWidth - size),
        Random().nextDouble() * (constraints.maxHeight - size),
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
        final (width, height) = (constraints.maxWidth, constraints.maxHeight);
        final corners = [
          (0, 0),
          (0, width - size),
          (height - size, 0),
          (height - size, width - size),
        ];

        final ticker = tickerProvider.createTicker((elapsed) {
          final (posX, posY) = pos.value;

          var (x, y) = (posX + dx * speed, posY + dy * speed);

          // Clamp positions
          if (x < 0) {
            x = 0;
            dx = 1;
          }
          if (x + size > width) {
            x = width - size;
            dx = -1;
          }
          if (y < 0) {
            y = 0;
            dy = 1;
          }
          if (y + size > height) {
            y = height - size;
            dy = -1;
          }

          // Bounce
          if (dir.value != (dx, dy)) {
            dir.value = (dx, dy);
            color.value = Color(
              (Random().nextDouble() * 0xFFFFFF).toInt(),
            ).withValues(alpha: 1);
          }

          pos.value = (x, y);

          // Corner detection
          if (corners.contains(pos.value)) {
            ref
                .read(screenSaverCornerControllerProvider.notifier)
                .detectCorner();
            ref.capture(AnalyticsEvent.cornerDetected());
          }
        })
          ..start();
        return ticker.dispose;
      },
      [constraints, size, speed],
    );

    return Positioned(
      left: x,
      top: y,
      child: Container(height: size, width: size, color: color.value),
    );
  }
}
