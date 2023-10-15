import 'package:flutter/material.dart';
import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';

class ExperiencesPage extends StatelessWidget {
  const ExperiencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: ResponsiveLayout.paddingOf(context),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const ExperiencesTitle();
        }
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
        );
      },
    );
  }
}
