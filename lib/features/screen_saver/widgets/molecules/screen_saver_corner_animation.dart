import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/features/screen_saver/screen_saver.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class ScreenSaverCornerAnimation extends HookConsumerWidget {
  const ScreenSaverCornerAnimation({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 1000));

    final size = useAnimation(
      Tween<double>(
        begin: 0,
        end: switch (ResponsiveLayout.of(context)) {
          ResponsiveLayout.md ||
          ResponsiveLayout.xs ||
          ResponsiveLayout.sm =>
            48,
          _ => 64,
        },
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0, 0.5, curve: Curves.easeOut),
        ),
      ),
    );

    ref.listen(screenSaverCornerControllerProvider, (_, __) async {
      controller.reset();
      await controller.forward();
      controller.reset();
    });

    return Text(
      context.l10n.screenSaverCorner,
      style: context.textTheme.displayLarge?.copyWith(
        color: context.colorScheme.onBackground,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
      textAlign: TextAlign.center,
    );
  }
}
