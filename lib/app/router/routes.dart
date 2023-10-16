import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luckuveryx/features/home/home.dart';
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
    return RootPage(navigator: navigator);
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

class ProjectsRoute extends GoRouteData {
  const ProjectsRoute();
  static const path = '/projects';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(child: Text(path));
  }
}

class InfoRoute extends GoRouteData {
  const InfoRoute();
  static const path = '/info';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(child: Text(path));
  }
}

class ContactRoute extends GoRouteData {
  const ContactRoute();
  static const path = '/contact';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(child: Text(path));
  }
}
