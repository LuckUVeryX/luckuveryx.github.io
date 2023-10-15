import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

double _useFadeIn({
  required Duration duration,
  required Duration offset,
  required Curve curve,
}) {
  final controller = useAnimationController(duration: duration);
  useEffect(
    () {
      Future.delayed(offset, controller.forward);
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
    this.offsetDuration = Duration.zero,
    this.curve = Curves.easeInOut,
    this.offset = Offset.zero,
    super.key,
  });

  final Widget child;
  final Duration duration;
  final Duration offsetDuration;
  final Curve curve;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final fade = _useFadeIn(
      curve: curve,
      duration: duration,
      offset: offsetDuration,
    );

    return Transform.translate(
      offset: offset * (1 - fade),
      child: Opacity(
        opacity: fade,
        child: child,
      ),
    );
  }
}
