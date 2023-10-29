import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/screen_saver/screen_saver.dart';
import 'package:luckuveryx/gen/assets.gen.dart';

class ScreenSaverHeartAnimation extends HookConsumerWidget {
  const ScreenSaverHeartAnimation({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);
    final timer = useRef<Timer?>(null);

    return GestureDetector(
      onTap: () {
        // Tap 10 times to manually trigger corner animation.
        timer.value?.cancel();
        timer.value = Timer(const Duration(milliseconds: 500), () {
          counter.value = 0;
          timer.value?.cancel();
          timer.value = null;
        });
        counter.value = counter.value + 1;
        if (counter.value >= 10) {
          counter.value = 0;
          timer.value?.cancel();
          timer.value = null;
          ref.read(screenSaverCornerControllerProvider.notifier).detectCorner();
          ref.capture(AnalyticsEvent.cornerAnimationManuallyTriggered());
        }
      },
      child: const _ScreenSaverHeartAnimation(),
    );
  }
}

class _ScreenSaverHeartAnimation extends HookConsumerWidget {
  const _ScreenSaverHeartAnimation();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 2000),
    );
    final opacity = useAnimation(
      Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.5, 1, curve: Curves.easeOutExpo),
        ),
      ),
    );

    ref.listen(screenSaverCornerControllerProvider, (_, __) async {
      controller.reset();
      await controller.forward();
      controller.reset();
    });
    return Opacity(
      opacity: opacity,
      child: Assets.lottie.heartAnimation.lottie(
        controller: controller,
        fit: BoxFit.contain,
      ),
    );
  }
}
