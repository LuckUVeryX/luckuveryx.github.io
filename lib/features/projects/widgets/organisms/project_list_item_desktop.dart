import 'package:flutter/material.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ProjectListItemDesktop extends StatelessWidget {
  const ProjectListItemDesktop({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ProjectDateText(project: project),
              ProjectLinksList(project: project),
            ],
          ),
          Spacing.sp24,
          ProjectTitle(project: project),
        ],
      ),
    );
  }
}
