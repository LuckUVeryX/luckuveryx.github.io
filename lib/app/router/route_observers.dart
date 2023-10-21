import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

void useRouterObserver(GoRouter router) {
  final context = useContext();

  useEffect(
    () {
      Future<void> posthogObserver() async {
        final matchList = await router.routeInformationParser
            .parseRouteInformationWithDependencies(
          router.routeInformationProvider.value,
          context,
        );
        final screenName = matchList.matches.lastOrNull?.matchedLocation;
        if (screenName == null) return;
        await Posthog().screen(screenName: screenName);
      }

      router.routerDelegate.addListener(posthogObserver);
      return () => router.routerDelegate.removeListener(posthogObserver);
    },
    [],
  );
}
