import 'package:flutter/material.dart';
import 'package:luckuveryx/app/router/routes.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/l10n/l10n.dart';

class RootAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RootAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        ...?ResponsiveLayout.builderOf(context, {
          ResponsiveLayout.sm: [
            const RootMenuIconButton(),
          ],
          ResponsiveLayout.lg: [
            TextButton(
              onPressed: () => const HomeRoute().go(context),
              child: Text(context.l10n.home),
            ),
            TextButton(
              onPressed: () => const ExperiencesRoute().go(context),
              child: Text(context.l10n.experiences),
            ),
            TextButton(
              onPressed: () => const ProjectsRoute().go(context),
              child: Text(context.l10n.projects),
            ),
            TextButton(
              onPressed: () => const ResumeRoute().go(context),
              child: Text(context.l10n.resume),
            ),
            const ThemeSwitcherIconButton(),
          ],
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
