import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    required this.label,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(),
      onPressed: onPressed,
      icon: Text(label),
      label: const AnimatedBounce(
        child: FaIcon(
          FontAwesomeIcons.arrowRight,
        ),
      ),
    );
  }
}
