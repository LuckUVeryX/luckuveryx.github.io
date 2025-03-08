import 'package:flutter/material.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ProjectListItemMobile extends StatelessWidget {
  const ProjectListItemMobile({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ProjectTitle(project: project),
        ProjectLinksList(project: project),
        ProjectDateText(project: project),
        Spacing.sp12,
      ],
    );
  }
}
