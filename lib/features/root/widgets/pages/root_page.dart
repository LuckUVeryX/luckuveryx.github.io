import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/l10n/l10n.dart';
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
      appBar: const RootAppBar(),
      body: Stack(
        children: [
          const Positioned(
            left: -1080,
            bottom: 0,
            child: AnimatedFadeIn(
              offset: Offset(-120, 0),
              child: RootBackgroundText(),
            ),
          ),
          const Positioned(
            top: 0,
            right: -1080,
            child: AnimatedFadeIn(
              offset: Offset(120, 0),
              child: RootBackgroundText(),
            ),
          ),
          navigator,
        ],
      ),
    );
  }
}
