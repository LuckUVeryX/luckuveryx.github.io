import 'package:flutter/material.dart';
import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:luckuveryx/features/experiences/widgets/organisms/experiences_list_item_mobile.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';

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
    return switch (ResponsiveLayout.of(context)) {
      ResponsiveLayout.xs || ResponsiveLayout.sm => ExperiencesListItemMobile(
          date: date,
          company: company,
          onPressed: onPressed,
          role: role,
          body: body,
          skills: skills,
        ),
      _ => ExperienceListItemDesktop(
          date: date,
          company: company,
          onPressed: onPressed,
          role: role,
          body: body,
          skills: skills,
        ),
    };
  }
}
