import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/root/root.dart';

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

    return AnimatedOpacity(
      opacity: isLoadingFonts ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: Scaffold(
        appBar: const RootAppBar(),
        body: Stack(
          children: [
            const Positioned(
              left: -800,
              bottom: 0,
              child: RootBackgroundText(),
            ),
            const Positioned(
              top: 0,
              right: -800,
              child: RootBackgroundText(),
            ),
            navigator,
          ],
        ),
      ),
    );
  }
}
