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
      child: RootBackgroundPattern(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const RootAppBar(),
          body: Stack(
            children: [
              const RootBackgroundText(),
              navigator,
            ],
          ),
        ),
      ),
    );
  }
}
