import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RootMenuIconButton extends HookWidget {
  const RootMenuIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );

    return IconButton(
      onPressed: () {
        if (controller.isCompleted) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: CurvedAnimation(curve: Curves.easeInOut, parent: controller),
      ),
    );
  }
}
