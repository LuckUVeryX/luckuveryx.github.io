import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:luckuveryx/features/root/root.dart';

class RouteButtonBuilder extends HookWidget {
  const RouteButtonBuilder({
    required this.onPressed,
    required this.path,
    required this.label,
    super.key,
  });

  final String path;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isCurrPath = GoRouterState.of(context).fullPath == path;
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    useEffect(
      () {
        controller
          ..reset()
          ..forward();
        return null;
      },
      [isCurrPath],
    );

    final opacity = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.easeOut).drive(
        Tween<double>(begin: 0.3, end: 1),
      ),
    );

    return Opacity(
      opacity: opacity,
      child: isCurrPath
          ? const RouteButtonPlaceholder()
          : RouteButton(onPressed: onPressed, label: label),
    );
  }
}
