import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/features/screen_saver/screen_saver.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ScreenSaverPage extends HookConsumerWidget {
  const ScreenSaverPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = useState<double>(48);
    final speed = useState<double>(2);

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
                  const EdgeInsets.all(20).copyWith(left: 0, bottom: 0),
                _ => const EdgeInsets.all(28).copyWith(left: 8, bottom: 0),
              },
              child: RootContainer(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        ScreenSaver(
                          constraints: constraints,
                          size: size.value,
                          speed: speed.value,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(context.l10n.screenSaverSpeed),
                      const Spacer(),
                      Text(
                        speed.value.toStringAsFixed(1),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Slider(
                    activeColor: context.colorScheme.tertiary,
                    value: speed.value,
                    max: 24,
                    onChanged: (value) => speed.value = value,
                  ),
                ),
                Spacing.sp8,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(context.l10n.screenSaverSize),
                      const Spacer(),
                      Text(
                        size.value.toStringAsFixed(1),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Slider(
                    activeColor: context.colorScheme.tertiaryContainer,
                    value: size.value,
                    min: 2,
                    max: 128,
                    onChanged: (value) => size.value = value,
                  ),
                ),
                Spacing.sp24,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
