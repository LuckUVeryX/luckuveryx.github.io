import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/app/router/router.dart';
import 'package:luckuveryx/app/theme/theme.dart';
import 'package:luckuveryx/features/theme_switcher/theme_switcher.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:luckuveryx/widgets/widgets.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(routerListenableProvider.notifier);

    final key = useRef(GlobalKey<NavigatorState>(debugLabel: 'root'));

    final router = useMemoized(
      () => GoRouter(
        routes: $appRoutes,
        navigatorKey: key.value,
        debugLogDiagnostics: true,
        refreshListenable: notifier,
        redirect: (context, state) => null,
        observers: [PosthogObserver()],
      ),
      [notifier],
    );

    return AnimatedFadeIn(
      child: MaterialApp.router(
        routerConfig: router,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ref.watch(themeSwitcherControllerProvider),
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        scrollBehavior: const NoThumbScrollBehavior().copyWith(
          scrollbars: false,
        ),
      ),
    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  const NoThumbScrollBehavior();
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}
