import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({
    required this.onPressed,
    required this.label,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
