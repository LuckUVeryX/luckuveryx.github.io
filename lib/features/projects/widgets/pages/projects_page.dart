import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 116, 8, 120),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 32, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.solidSquare,
                    size: 16,
                  ),
                  Spacing.sp4,
                  Text(
                    context.l10n.projects,
                    style: context.textTheme.titleSmall,
                  ),
                ],
              ),
            );
          }
          return ListTile(
            titleTextStyle: context.textTheme.displayMedium,
            subtitleTextStyle: context.textTheme.titleMedium,
            title: const Text(
              'Title',
              textAlign: TextAlign.right,
            ),
            subtitle: const Text(
              'Year / Link / Link',
              textAlign: TextAlign.right,
            ),
          );
        },
      ),
    );
  }
}
