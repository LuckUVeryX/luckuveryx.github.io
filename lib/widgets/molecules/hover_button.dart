import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HoverButton extends HookWidget {
  const HoverButton({
    required this.onPressed,
    required this.builder,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget Function(bool hover) builder;

  @override
  Widget build(BuildContext context) {
    final hover = useState(false);
    return GestureDetector(
      onTap: onPressed,
      onTapDown: (_) => hover.value = true,
      onTapCancel: () => hover.value = false,
      onTapUp: (_) => hover.value = false,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => hover.value = true,
        onExit: (_) => hover.value = false,
        child: builder(hover.value),
      ),
    );
  }
}
