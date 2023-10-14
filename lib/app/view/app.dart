import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luckuveryx/app/router/router.dart';
import 'package:luckuveryx/app/theme/theme.dart';
import 'package:luckuveryx/l10n/l10n.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(routerListenableProvider.notifier);

    final key = useRef(GlobalKey<NavigatorState>(debugLabel: 'routerKey'));
    final router = useMemoized(
      () => GoRouter(
        routes: $appRoutes,
        navigatorKey: key.value,
        debugLogDiagnostics: true,
        refreshListenable: notifier,
        redirect: RouterUtils.redirect,
      ),
      [notifier],
    );

    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
