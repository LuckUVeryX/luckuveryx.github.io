import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

double _useFadeIn({required Duration duration, required Curve curve}) {
  final controller = useAnimationController(duration: duration);
  useEffect(
    () {
      controller.forward();
      return null;
    },
    const [],
  );
  return useAnimation(CurvedAnimation(parent: controller, curve: curve));
}

class AnimatedFadeIn extends HookWidget {
  const AnimatedFadeIn({
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeInOut,
    super.key,
  });

  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final fade = _useFadeIn(curve: curve, duration: duration);

    return Opacity(opacity: fade, child: child);
  }
}
