import 'package:flutter/material.dart';

class AnimatedTextStyle extends StatelessWidget {
  const AnimatedTextStyle({
    required this.child,
    required this.style,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOut,
    super.key,
  });

  final Widget child;
  final TextStyle style;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: style,
      duration: duration,
      curve: curve,
      child: child,
    );
  }
}
