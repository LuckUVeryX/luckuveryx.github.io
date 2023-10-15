import 'package:flutter/material.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class ExperiencesTitle extends StatelessWidget {
  const ExperiencesTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.l10n.experiences}.',
      style: context.textTheme.displayLarge?.copyWith(
        color: context.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
