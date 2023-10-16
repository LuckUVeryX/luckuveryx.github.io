import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/projects/projects.dart';

class ProjectsPage extends HookConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    return Align(
      alignment: Alignment.topRight,
      child: ListView.builder(
        itemCount: projects.length + 1,
        padding: const EdgeInsets.fromLTRB(0, 116, 8, 120),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 32, right: 16),
              child: ProjectHeader(),
            );
          }
          final project = projects[index - 1];
          return Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IntrinsicWidth(
                child: ProjectListItem(project: project),
              ),
            ),
          );
        },
      ),
    );
  }
}
