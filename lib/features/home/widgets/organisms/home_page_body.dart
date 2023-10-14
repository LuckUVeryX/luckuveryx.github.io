import 'dart:async';

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
    final titleController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final contentController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    useEffect(
      () {
        titleController.forward();
        Future.delayed(
          const Duration(milliseconds: 50),
          contentController.forward,
        );
        return null;
      },
      [],
    );

    final titleAnimation =
        CurvedAnimation(parent: titleController, curve: Curves.easeInOut);

    final contentAnimation =
        CurvedAnimation(parent: contentController, curve: Curves.easeInOut);

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
                        'LuckUVeryX',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TyperAnimatedText(
                        'Ryan Yip',
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
