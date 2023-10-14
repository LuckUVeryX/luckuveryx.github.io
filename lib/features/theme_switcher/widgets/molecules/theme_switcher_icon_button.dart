import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class ThemeSwitcherIconButton extends HookConsumerWidget {
  const ThemeSwitcherIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final value = switch (context.theme.brightness) {
          Brightness.light => ThemeMode.dark,
          Brightness.dark => ThemeMode.light,
        };
        ref.read(themeSwitcherControllerProvider.notifier).onChanged(value);
      },
      icon: const RotatedBox(
        quarterTurns: 2,
        child: FaIcon(FontAwesomeIcons.circleHalfStroke),
      ),
    );
  }
}
