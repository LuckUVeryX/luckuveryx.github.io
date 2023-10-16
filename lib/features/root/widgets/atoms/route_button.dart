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
    return InkWell(
      onTap: onPressed,
      customBorder: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
