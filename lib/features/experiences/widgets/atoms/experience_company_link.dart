import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class ExperienceCompanyLink extends HookWidget {
  const ExperienceCompanyLink({
    required this.title,
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final hover = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
          .drive(Tween<double>(begin: 0, end: 2)),
    );

    return InkWell(
      customBorder: const StadiumBorder(),
      onHover: (value) => value ? controller.forward() : controller.reverse(),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 0, 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
            Spacing.sp8,
            Transform(
              transform: Matrix4.identity()
                ..translate(0.0 + hover, 6 - hover)
                ..scale(12 / 24),
              child: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
