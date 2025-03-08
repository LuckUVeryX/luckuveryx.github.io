import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ProjectHeader extends StatelessWidget {
  const ProjectHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const FaIcon(FontAwesomeIcons.solidSquare, size: 16),
        Spacing.sp8,
        Text(context.l10n.projects, style: context.titleStyle),
      ],
    );
  }
}
