import 'package:flutter/material.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectLinksList extends StatelessWidget {
  const ProjectLinksList({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final link in project.links) ...[
          if (link != project.links.first) const Text(' / '),
          HoverButton(
            onPressed: () => launchUrl(link.url),
            builder: (details) => Text(
              link.label,
              style: context.bodyStyle?.copyWith(
                color: details.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
