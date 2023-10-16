import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/app/router/router.dart';
import 'package:luckuveryx/features/root/root.dart';
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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(28),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: context.colorScheme.onBackground,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Ryan Yip',
                  style: context.textTheme.displaySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'LuckUVeryx',
                  style: context.textTheme.titleSmall,
                ),
              ),
              Spacing.sp16,
              RouteButtonBuilder(
                path: HomeRoute.path,
                label: context.l10n.home,
                onPressed: () => const HomeRoute().go(context),
              ),
              RouteButtonBuilder(
                path: ProjectsRoute.path,
                label: context.l10n.projects,
                onPressed: () => const ProjectsRoute().go(context),
              ),
              RouteButtonBuilder(
                path: InfoRoute.path,
                label: context.l10n.info,
                onPressed: () => const InfoRoute().go(context),
              ),
              RouteButtonBuilder(
                path: ContactRoute.path,
                label: context.l10n.contact,
                onPressed: () => const ContactRoute().go(context),
              ),
              Expanded(child: navigator),
            ],
          ),
        ),
      ),
    );
  }
}
