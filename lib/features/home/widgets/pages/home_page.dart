import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:luckuveryx/app/router/router.dart';
import 'package:luckuveryx/features/responsive/responsive.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutScrollView(
        child: ResponsivePadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: context.textTheme.displayLarge!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                    child: AnimatedFadeIn(
                      offset: const Offset(0, 120),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText(
                            'LuckUVeryX.',
                            speed: const Duration(milliseconds: 100),
                          ),
                          TyperAnimatedText(
                            'Ryan Yip.',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacing.sp8,
                  AnimatedFadeIn(
                    offset: const Offset(0, 120),
                    offsetDuration: const Duration(milliseconds: 50),
                    child: StyledRichText(
                      text: context.l10n.homeContent,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              Spacing.sp8,
              AnimatedFadeIn(
                offset: const Offset(0, 120),
                offsetDuration: const Duration(milliseconds: 100),
                child: NextPageButton(
                  label: context.l10n.viewExperiences,
                  onPressed: () => const ExperiencesRoute().go(context),
                ),
              ),
              const AnimatedFadeIn(
                offset: Offset(0, 120),
                offsetDuration: Duration(milliseconds: 150),
                child: SocialButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
