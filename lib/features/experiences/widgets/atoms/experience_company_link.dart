import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperienceCompanyLink extends StatelessWidget {
  const ExperienceCompanyLink({
    required this.title,
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Text(title),
      label: const FaIcon(
        FontAwesomeIcons.arrowUpRightFromSquare,
        size: 12,
      ),
    );
  }
}
