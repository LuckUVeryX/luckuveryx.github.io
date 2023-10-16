import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({
    required this.navigator,
    super.key,
  });

  final Widget navigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingFonts = ref
        .watch(googleFontsPendingProvider.select((value) => value.isLoading));

    if (isLoadingFonts) {
      return Scaffold(
        body: Center(
          child: LoadingIndicator(
            label: context.l10n.loadingFonts,
          ),
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacing.sp28,
              BrightnessButton(brightness: Brightness.dark),
              BrightnessButton(brightness: Brightness.light),
              Spacing.sp20,
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(28).copyWith(left: 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: context.colorScheme.onBackground,
                ),
              ),
              child: Stack(
                children: [
                  AnimatedFadeIn(child: navigator),
                  const Positioned(
                    left: 0,
                    top: 0,
                    child: AnimatedFadeIn(child: RootHeader()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
