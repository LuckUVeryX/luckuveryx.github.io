import 'package:flutter/material.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
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
    );
  }
}
