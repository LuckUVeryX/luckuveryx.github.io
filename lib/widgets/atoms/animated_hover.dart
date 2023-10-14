import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedHover extends HookWidget {
  const AnimatedHover({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 100));
    final hover = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut).drive(
        Tween<double>(begin: 1, end: 1.25),
      ),
    );

    return MouseRegion(
      onEnter: (_) => controller.forward(),
      onExit: (_) => controller.reverse(),
      child: Transform.scale(
        scale: hover,
        child: child,
      ),
    );
  }
}
