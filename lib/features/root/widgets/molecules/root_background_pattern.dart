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
    final image = Assets.images.backgroundPattern.provider();

    useEffect(
      () {
        Future.delayed(Duration.zero, () => precacheImage(image, context));
        return null;
      },
      [],
    );

    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        image: DecorationImage(
          image: image,
          opacity: 0.2,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            context.theme.disabledColor.withOpacity(0.2),
            BlendMode.srcIn,
          ),
        ),
      ),
      child: child,
    );
  }
}
