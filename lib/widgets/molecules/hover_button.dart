import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

HoverDetails _useHover(bool hover) {
  final controller = useAnimationController(
    duration: const Duration(milliseconds: 100),
  );

  useEffect(
    () {
      controller.animateTo(hover ? 1 : 0);
      return null;
    },
    [hover],
  );

  final color = useAnimation(
    ColorTween(
      begin: useContext().colorScheme.onBackground,
      end: useContext().theme.disabledColor,
    ).chain(CurveTween(curve: Curves.easeOut)).animate(controller),
  );

  if (color == null) throw Exception('useHoverColorAnimation color is null');

  return HoverDetails(
    isHover: hover,
    color: color,
  );
}

class HoverButton extends HookWidget {
  const HoverButton({
    required this.onPressed,
    required this.builder,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget Function(HoverDetails details) builder;

  @override
  Widget build(BuildContext context) {
    final hover = useState(false);
    final details = _useHover(hover.value);

    return GestureDetector(
      onTap: onPressed,
      onTapDown: (_) => hover.value = true,
      onTapCancel: () => hover.value = false,
      onTapUp: (_) => hover.value = false,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => hover.value = true,
        onExit: (_) => hover.value = false,
        child: builder(details),
      ),
    );
  }
}
