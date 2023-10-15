import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/app/router/router.dart';
import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/widgets/molecules/molecules.dart';

class ExperiencesPage extends HookConsumerWidget {
  const ExperiencesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences = ref.watch(experiencesProvider);
    final length = experiences.length;

    return ListView.builder(
      itemCount: length + 3,
      padding: ResponsiveLayout.paddingOf(context),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const ExperiencesTitle();
        }

        if (index == length + 1) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: const Offset(-12, 0),
              child: NextPageButton(
                label: context.l10n.viewProjects,
                onPressed: () => const ProjectsRoute().go(context),
              ),
            ),
          );
        }

        if (index == length + 2) {
          return const SocialButtons();
        }

        final experience = experiences[index - 1];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Builder(builder: experience.toItem()),
        );
      },
    );
  }
}
