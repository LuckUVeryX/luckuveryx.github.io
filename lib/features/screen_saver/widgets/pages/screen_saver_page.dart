import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/features/screen_saver/screen_saver.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ScreenSaverPage extends HookConsumerWidget {
  const ScreenSaverPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (:speed, :size) = ref.watch(screenSaverSettingsControllerProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: switch (ResponsiveLayout.of(context)) {
                // Accounts for ThemeButton width of 20.
                ResponsiveLayout.md ||
                ResponsiveLayout.xs ||
                ResponsiveLayout.sm =>
                  const EdgeInsets.all(
                    20,
                  ).copyWith(left: 0, bottom: 0),
                _ => const EdgeInsets.all(28).copyWith(left: 8, bottom: 0),
              },
              child: RootContainer(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        ScreenSaver(constraints: constraints),
                        const Positioned.fill(
                          child: ScreenSaverHeartAnimation(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 4, 0),
            child: ScreenSaverSetttingsSlider(
              label: context.l10n.screenSaverSpeed,
              value: speed,
              min: 0,
              max: 24,
              onChanged: ref
                  .read(screenSaverSettingsControllerProvider.notifier)
                  .onSpeedChanged,
              onChangeEnd: (value) {
                ref.capture(AnalyticsEvent.speedSliderValue(speed));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 4, 0),
            child: ScreenSaverSetttingsSlider(
              label: context.l10n.screenSaverSize,
              value: size,
              min: 4,
              max: 128,
              onChanged: ref
                  .read(screenSaverSettingsControllerProvider.notifier)
                  .onSizeChanged,
              onChangeEnd: (value) {
                ref.capture(AnalyticsEvent.sizeSliderValue(size));
              },
            ),
          ),
          Spacing.sp24,
        ],
      ),
    );
  }
}
