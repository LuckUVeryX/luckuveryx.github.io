import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

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
    return HoverButton(
      onPressed: onPressed,
      builder: (hover) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: AnimatedTextStyle(
          style: context.textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: hover ? context.theme.disabledColor : null,
          ),
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
