import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luckuveryx/features/root/root.dart';

part 'routes.g.dart';

@TypedShellRoute<RootRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: HomeRoute.path),
    TypedGoRoute<ProjectsRoute>(path: ProjectsRoute.path),
    TypedGoRoute<InfoRoute>(path: InfoRoute.path),
    TypedGoRoute<ContactRoute>(path: ContactRoute.path),
  ],
)
class RootRoute extends ShellRouteData {
  const RootRoute();
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
    return const _FadeTransitionPage(child: Center(child: Text(path)));
  }
}

class ProjectsRoute extends GoRouteData {
  const ProjectsRoute();
  static const path = '/projects';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const _FadeTransitionPage(child: Center(child: Text(path)));
  }
}

class InfoRoute extends GoRouteData {
  const InfoRoute();
  static const path = '/info';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const _FadeTransitionPage(child: Center(child: Text(path)));
  }
}

class ContactRoute extends GoRouteData {
  const ContactRoute();
  static const path = '/contact';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const _FadeTransitionPage(child: Center(child: Text(path)));
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
