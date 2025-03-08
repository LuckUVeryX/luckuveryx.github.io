import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectLinksList extends HookConsumerWidget {
  const ProjectLinksList({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final link in project.links) ...[
          if (link != project.links.first) const Text(' / '),
          HoverButton(
            onPressed: () {
              launchUrl(link.url);
              ref.capture(AnalyticsEvent.projectSubLinkTapped(project.url));
            },
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
