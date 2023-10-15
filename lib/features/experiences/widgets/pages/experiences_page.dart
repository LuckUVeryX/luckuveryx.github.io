import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';

class ExperiencesPage extends HookConsumerWidget {
  const ExperiencesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences = ref.watch(experiencesProvider);

    return ListView.builder(
      itemCount: experiences.length + 1,
      padding: ResponsiveLayout.paddingOf(context),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const ExperiencesTitle();
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
