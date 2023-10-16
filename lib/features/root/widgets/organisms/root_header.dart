import 'package:flutter/material.dart';
import 'package:luckuveryx/app/router/router.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:luckuveryx/widgets/widgets.dart';

class RootHeader extends StatelessWidget {
  const RootHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'Ryan Yip',
            style: context.textTheme.displaySmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'LuckUVeryx',
            style: context.textTheme.titleSmall,
          ),
        ),
        Spacing.sp24,
        RouteButtonBuilder(
          path: HomeRoute.path,
          label: context.l10n.home,
          onPressed: () => const HomeRoute().go(context),
        ),
        RouteButtonBuilder(
          path: ProjectsRoute.path,
          label: context.l10n.projects,
          onPressed: () => const ProjectsRoute().go(context),
        ),
        RouteButtonBuilder(
          path: InfoRoute.path,
          label: context.l10n.info,
          onPressed: () => const InfoRoute().go(context),
        ),
        RouteButtonBuilder(
          path: ContactRoute.path,
          label: context.l10n.contact,
          onPressed: () => const ContactRoute().go(context),
        ),
      ],
    );
  }
}
