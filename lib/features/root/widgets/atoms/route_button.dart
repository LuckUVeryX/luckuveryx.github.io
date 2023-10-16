import 'package:flutter/material.dart';

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
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
