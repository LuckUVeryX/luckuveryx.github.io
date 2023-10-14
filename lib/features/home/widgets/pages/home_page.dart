import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/home/home.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/l10n/l10n.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(context.l10n.home),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(context.l10n.about),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(context.l10n.projects),
                    ),
                    const ThemeSwitcherIconButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const HomeBottomAppBar(),
    );
  }
}
