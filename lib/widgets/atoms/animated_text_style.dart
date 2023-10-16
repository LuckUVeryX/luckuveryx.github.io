import 'package:flutter/material.dart';

class AnimatedTextStyle extends StatelessWidget {
  const AnimatedTextStyle({
    required this.style,
    required this.child,
    super.key,
  });

  final Widget child;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
      style: style,
      child: child,
    );
  }
}
