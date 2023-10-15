import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

double _useBounce({required Duration duration}) {
  final controller = useAnimationController(duration: duration);
  useEffect(
    () {
      controller
        ..addStatusListener((status) {
          final onStatusChanged = switch (status) {
            AnimationStatus.completed => controller.reverse,
            AnimationStatus.dismissed => controller.forward,
            _ => null,
          };
          onStatusChanged?.call();
        })
        ..forward();
      return null;
    },
    const [],
  );
  return useAnimation(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    ),
  );
}

class AnimatedBounce extends HookWidget {
  const AnimatedBounce({
    required this.child,
    this.offset = const Offset(8, 0),
    this.duration = const Duration(milliseconds: 500),
    super.key,
  });

  final Widget child;
  final Duration duration;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final bounce = _useBounce(duration: duration);
    return Transform.translate(
      offset: offset * bounce,
      child: child,
    );
  }
}
