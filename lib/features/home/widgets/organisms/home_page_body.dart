import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class HomePageBody extends HookWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    )..forward();

    final titleAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 100,
        ),
      ],
    ).animate(controller);

    final contentAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(
          tween: ConstantTween<double>(0),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 50,
        ),
      ],
    ).animate(controller);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: context.textTheme.displayMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
          child: AnimatedBuilder(
            animation: titleAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 120 - 120 * titleAnimation.value),
                child: Opacity(
                  opacity: titleAnimation.value,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Ryan Yip',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TyperAnimatedText(
                        'LuckUVeryX',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        AnimatedBuilder(
          animation: contentAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 120 - 120 * contentAnimation.value),
              child: Opacity(
                opacity: contentAnimation.value,
                child: StyledRichText(
                  text: context.l10n.homeContent,
                  style: context.textTheme.bodyLarge,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
