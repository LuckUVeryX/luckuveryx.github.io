import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/features/year_progress/year_progress.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({required this.navigator, super.key});

  final Widget navigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: switch (ResponsiveLayout.of(context)) {
          // Accounts for ThemeButton width of 20.
          ResponsiveLayout.md ||
          ResponsiveLayout.xs ||
          ResponsiveLayout.sm =>
            const EdgeInsets.all(20).copyWith(left: 0),
          _ => const EdgeInsets.all(28).copyWith(left: 8),
        },
        child: Column(
          children: [
            Expanded(
              child: RootContainer(
                child: WavesBackground(
                  child: Stack(
                    children: [
                      navigator,
                      const Align(
                        alignment: Alignment.topLeft,
                        child: RootHeader(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 28),
              child: YearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
