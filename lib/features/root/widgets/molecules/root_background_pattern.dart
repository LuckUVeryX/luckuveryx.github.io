import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luckuveryx/gen/assets.gen.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';

class RootBackgroundPattern extends HookWidget {
  const RootBackgroundPattern({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final image = useMemoized(
      () => DecorationImage(
        fit: BoxFit.cover,
        image: Assets.images.backgroundPattern.provider(),
        colorFilter: ColorFilter.mode(
          context.theme.disabledColor.withOpacity(0.05),
          BlendMode.srcIn,
        ),
      ),
      // Trigger rebuild of background after theme changed.
      [context.theme.brightness],
    );

    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        image: image,
      ),
      child: child,
    );
  }
}
