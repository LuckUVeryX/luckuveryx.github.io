import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luckuveryx/features/contact/contact.dart';
import 'package:luckuveryx/features/home/home.dart';
import 'package:luckuveryx/features/info/info.dart';
import 'package:luckuveryx/features/projects/projects.dart';
import 'package:luckuveryx/features/root/root.dart';
import 'package:luckuveryx/features/screen_saver/screen_saver.dart';

part 'routes.g.dart';

final rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

@TypedShellRoute<RootRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(
      path: HomeRoute.path,
      routes: [
        TypedGoRoute<ScreenSaverRoute>(path: ScreenSaverRoute.path),
      ],
    ),
    TypedGoRoute<ProjectsRoute>(path: ProjectsRoute.path),
    TypedGoRoute<InfoRoute>(path: InfoRoute.path),
    TypedGoRoute<ContactRoute>(path: ContactRoute.path),
  ],
)
class RootRoute extends ShellRouteData {
  const RootRoute();
  static final GlobalKey<NavigatorState> $navigatorKey = shellKey;
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
    return const ProjectsPage();
  }
}

class InfoRoute extends GoRouteData {
  const InfoRoute();
  static const path = '/info';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const InfoPage();
  }
}

class ContactRoute extends GoRouteData {
  const ContactRoute();
  static const path = '/contact';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ContactPage();
  }
}

class ScreenSaverRoute extends GoRouteData {
  const ScreenSaverRoute();
  static const path = 'screen-saver';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ScreenSaverPage();
  }
}
