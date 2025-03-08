import 'package:flutter/material.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';

class ProjectListItem extends StatelessWidget {
  const ProjectListItem({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    switch (ResponsiveLayout.of(context)) {
      case ResponsiveLayout.xs:
      case ResponsiveLayout.sm:
      case ResponsiveLayout.md:
        return ProjectListItemMobile(project: project);
      case ResponsiveLayout.lg:
      case ResponsiveLayout.xl:
      case ResponsiveLayout.xxl:
        return ProjectListItemDesktop(project: project);
    }
  }
}
