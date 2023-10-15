import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luckuveryx/widgets/widgets.dart';

bool _useLoading({required Duration duration}) {
  final showLoading = useState(false);

  useEffect(
    () {
      Future.delayed(duration, () => showLoading.value = true);
      return null;
    },
    [],
  );

  return showLoading.value;
}

class LoadingIndicator extends HookWidget {
  const LoadingIndicator({
    super.key,
    this.label,
    this.duration = const Duration(milliseconds: 2000),
  });

  /// Minimum [Duration] passed before showing loading indicator.
  final Duration duration;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final showLoading = _useLoading(duration: duration);

    if (!showLoading) return const Offstage();

    return AnimatedFadeIn(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          if (label != null) ...[
            Spacing.sp16,
            AnimatedTextKit(
              animatedTexts: [TyperAnimatedText(label!)],
              repeatForever: true,
            ),
          ],
        ],
      ),
    );
  }
}
