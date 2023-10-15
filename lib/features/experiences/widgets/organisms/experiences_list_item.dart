import 'package:flutter/material.dart';
import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ExperiencesListItem extends StatelessWidget {
  const ExperiencesListItem({
    required this.date,
    required this.company,
    required this.role,
    required this.body,
    required this.skills,
    required this.onPressed,
    super.key,
  });

  final String date;
  final String company;
  final String role;
  final String body;
  final List<String> skills;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      offset: const Offset(0, 20),
      child: Table(
        textBaseline: TextBaseline.alphabetic,
        defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
        columnWidths: const {0: FlexColumnWidth(), 1: FlexColumnWidth(3)},
        children: [
          TableRow(
            children: [
              Text(
                date,
                style: context.textTheme.bodySmall,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Transform.translate(
                  // Account for Button Padding
                  offset: const Offset(-12, 0),
                  child: ExperienceCompanyLink(
                    title: company,
                    onPressed: onPressed,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Offstage(),
              Text(
                role,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onBackground.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const TableRow(children: [Offstage(), Spacing.sp4]),
          TableRow(
            children: [
              const Offstage(),
              Text(body),
            ],
          ),
          const TableRow(children: [Offstage(), Spacing.sp8]),
          TableRow(
            children: [
              const Offstage(),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [...skills.map((e) => Chip(label: Text(e)))],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
