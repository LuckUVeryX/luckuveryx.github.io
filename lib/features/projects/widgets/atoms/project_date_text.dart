import 'package:flutter/material.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';

class ProjectDateText extends StatelessWidget {
  const ProjectDateText({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Text(project.dateString(), style: context.labelStyle);
  }
}
