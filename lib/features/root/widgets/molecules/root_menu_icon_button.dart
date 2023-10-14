import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/app/router/router.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class RootMenuIconButton extends HookConsumerWidget {
  const RootMenuIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );

    return PopupMenuButton(
      onOpened: controller.forward,
      onCanceled: controller.reverse,
      onSelected: (_) => controller.reverse(),
      offset: const Offset(0, 48),
      itemBuilder: (context) {
        return <PopupMenuEntry<void>>[
          PopupMenuItem<void>(
            child: Text(context.l10n.home),
            onTap: () => const HomeRoute().go(context),
          ),
          PopupMenuItem<void>(
            child: Text(context.l10n.experiences),
            onTap: () => const ExperiencesRoute().go(context),
          ),
          PopupMenuItem<void>(
            child: Text(context.l10n.projects),
            onTap: () => const ProjectsRoute().go(context),
          ),
          PopupMenuItem<void>(
            child: Text(context.l10n.resume),
            onTap: () => const ResumeRoute().go(context),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<void>(
            onTap: () {
              final value = switch (context.theme.brightness) {
                Brightness.light => ThemeMode.dark,
                Brightness.dark => ThemeMode.light,
              };
              ref
                  .read(themeSwitcherControllerProvider.notifier)
                  .onChanged(value);
            },
            child: const FaIcon(FontAwesomeIcons.circleHalfStroke),
          ),
        ];
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: CurvedAnimation(curve: Curves.easeInOut, parent: controller),
      ),
    );
  }
}
