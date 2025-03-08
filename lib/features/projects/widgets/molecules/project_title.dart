import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/features/analytics/analytics.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTitle extends HookConsumerWidget {
  const ProjectTitle({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HoverButton(
      onPressed: () {
        launchUrl(project.url);
        ref.capture(AnalyticsEvent.projectLinkTapped(project.url));
      },
      builder: (hover) {
        return Text(
          project.title,
          textAlign: TextAlign.right,
          style: context.displayStyle?.copyWith(color: hover.color),
        );
      },
    );
  }
}
