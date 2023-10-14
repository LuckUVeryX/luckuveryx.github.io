import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
}

class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class ExperiencesRoute extends GoRouteData {
  const ExperiencesRoute();
  static const path = '/experiences';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(
      child: Text(path),
    );
  }
}

class ProjectsRoute extends GoRouteData {
  const ProjectsRoute();
  static const path = '/projects';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(
      child: Text(path),
    );
  }
}

class ResumeRoute extends GoRouteData {
  const ResumeRoute();
  static const path = '/resume';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(
      child: Text(path),
    );
  }
}
