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
    return LayoutScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ResponsiveLayout.paddingOf(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: context.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
                  child: AnimatedFadeIn(
                    child: AnimatedTextKit(
                      repeatForever: true,
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
                ),
                Spacing.sp8,
                AnimatedFadeIn(
                  offsetDuration: const Duration(milliseconds: 50),
                  child: StyledRichText(
                    text: context.l10n.homeContent,
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          Spacing.sp8,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.paddingValueOf(context) - 12,
            ),
            child: AnimatedFadeIn(
              offsetDuration: const Duration(milliseconds: 100),
              child: NextPageButton(
                label: context.l10n.viewExperiences,
                onPressed: () => const ExperiencesRoute().go(context),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.paddingValueOf(context) - 12,
            ),
            child: const AnimatedFadeIn(
              offsetDuration: Duration(milliseconds: 150),
              child: SocialButtons(),
            ),
          ),
        ],
      ),
    );
  }
}
