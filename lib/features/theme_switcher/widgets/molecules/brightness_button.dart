import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class BrightnessButton extends HookConsumerWidget {
  const BrightnessButton({
    required this.brightness,
    super.key,
  });

  final Brightness brightness;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RotatedBox(
      quarterTurns: 3,
      child: HoverButton(
        onPressed: () => ref
            .read(themeSwitcherControllerProvider.notifier)
            .onChanged(brightness),
        builder: (hover) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              context.theme.brightness == brightness
                  ? FontAwesomeIcons.solidSquare
                  : FontAwesomeIcons.square,
              size: 12,
              color: hover.color,
            ),
            Spacing.sp4,
            Text(
              switch (brightness) {
                Brightness.light => context.l10n.light,
                Brightness.dark => context.l10n.dark,
              }
                  .toUpperCase(),
              style: context.textTheme.bodyMedium!.copyWith(
                color: hover.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
