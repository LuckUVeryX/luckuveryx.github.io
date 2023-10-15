import 'package:flutter/material.dart';
import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ExperiencesListItemMobile extends StatelessWidget {
  const ExperiencesListItemMobile({
    required this.date,
    required this.company,
    required this.onPressed,
    required this.role,
    required this.body,
    required this.skills,
    super.key,
  });

  final String date;
  final String company;
  final VoidCallback onPressed;
  final String role;
  final String body;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onBackground.withOpacity(0.7),
          ),
        ),
        Transform.translate(
          offset: const Offset(-12, 0),
          child: ExperienceCompanyLink(
            title: company,
            onPressed: onPressed,
          ),
        ),
        Text(
          role,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onBackground.withOpacity(0.7),
          ),
        ),
        Spacing.sp8,
        Text(body),
        Spacing.sp8,
        Wrap(
          runSpacing: 4,
          spacing: 4,
          children: [...skills.map((e) => SkillChip(label: e))],
        ),
      ],
    );
  }
}
