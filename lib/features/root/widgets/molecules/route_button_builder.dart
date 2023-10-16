import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luckuveryx/features/root/root.dart';

class RouteButtonBuilder extends StatelessWidget {
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
    final currPath = GoRouterState.of(context).fullPath;
    if (currPath == path) return const RouteButtonPlaceholder();
    return RouteButton(onPressed: onPressed, label: label);
  }
}
