import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

double _useSlideIn({required Duration duration, required Curve curve}) {
  final controller = useAnimationController(duration: duration);
  useEffect(
    () {
      controller.forward();
      return null;
    },
    const [],
  );
  return useAnimation(
    CurvedAnimation(
      parent: controller,
      curve: curve,
    ).drive(Tween<double>(begin: 1, end: 0)),
  );
}

class AnimatedSlideIn extends HookWidget {
  const AnimatedSlideIn({
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeInOut,
    this.offset = const Offset(0, 20),
    super.key,
  });

  final Widget child;
  final Duration duration;
  final Curve curve;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final translate = _useSlideIn(curve: curve, duration: duration);

    return Transform.translate(offset: offset * translate, child: child);
  }
}
