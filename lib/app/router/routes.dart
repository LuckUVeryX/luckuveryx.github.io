import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:luckuveryx/features/home/home.dart';
import 'package:luckuveryx/features/root/root.dart';

part 'routes.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

@TypedShellRoute<RootRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: HomeRoute.path),
    TypedGoRoute<ExperiencesRoute>(path: ExperiencesRoute.path),
    TypedGoRoute<ProjectsRoute>(path: ProjectsRoute.path),
    TypedGoRoute<ResumeRoute>(path: ResumeRoute.path),
  ],
)
class RootRoute extends ShellRouteData {
  const RootRoute();
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return RootPage(
      navigator: navigator,
    );
  }

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return _FadeTransitionPage(child: RootPage(navigator: navigator));
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const _FadeTransitionPage(child: HomePage());
  }
}

class ExperiencesRoute extends GoRouteData {
  const ExperiencesRoute();
  static const path = '/experiences';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const _FadeTransitionPage(child: ExperiencesPage());
  }
}

class ProjectsRoute extends GoRouteData {
  const ProjectsRoute();
  static const path = '/projects';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const _FadeTransitionPage(
      child: Center(
        child: Text(path),
      ),
    );
  }
}

class ResumeRoute extends GoRouteData {
  const ResumeRoute();
  static const path = '/resume';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const _FadeTransitionPage(
      child: Center(
        child: Text(path),
      ),
    );
  }
}

class _FadeTransitionPage<T> extends CustomTransitionPage<T> {
  const _FadeTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
