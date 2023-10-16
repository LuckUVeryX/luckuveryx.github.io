import 'package:flutter/material.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsListItem extends StatelessWidget {
  const ProjectsListItem({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        HoverButton(
          onPressed: () => launchUrl(project.url),
          builder: (hover) {
            return Text(
              project.title,
              textAlign: TextAlign.right,
              style: context.displayStyle?.copyWith(
                color: hover.color,
              ),
            );
          },
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final link in project.links) ...[
              if (link != project.links.first) const Text(' / '),
              HoverButton(
                onPressed: () => launchUrl(link.url),
                builder: (details) => Text(
                  link.label,
                  style: context.titleStyle?.copyWith(
                    color: details.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
        Text(
          project.dateString(),
          style: context.titleStyle,
        ),
        Spacing.sp12,
      ],
    );
  }
}