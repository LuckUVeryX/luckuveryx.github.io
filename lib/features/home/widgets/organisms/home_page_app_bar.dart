import 'package:flutter/material.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/l10n/l10n.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(context.l10n.home),
        ),
        TextButton(
          onPressed: () {},
          child: Text(context.l10n.projects),
        ),
        TextButton(
          onPressed: () {},
          child: Text(context.l10n.resume),
        ),
        const ThemeSwitcherIconButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
