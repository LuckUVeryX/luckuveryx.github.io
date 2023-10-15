import 'package:flutter/material.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ExperiencesTitle extends StatelessWidget {
  const ExperiencesTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      offset: const Offset(0, 20),
      child: AnimatedTextStyle(
        style: ResponsiveLayout.displayStyleOf(context)!.copyWith(
          color: context.colorScheme.primary,
        ),
        child: Text(
          '${context.l10n.experiences}.',
        ),
      ),
    );
  }
}
