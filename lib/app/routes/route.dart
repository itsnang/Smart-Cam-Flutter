import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:update_her/pages/splash/splash_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    onException: (context, state, router) => router.go('/'),
    routes: [
      ...mainRoutes,
    ],
  );

  late final mainRoutes = <GoRoute>[
    GoRoute(
      path: '/',
      redirect: (context, state) => '/home',
    ),
    GoRoute(
      path: '/forceUpdate',
      builder: (context, state) => SplashScreen(key: state.pageKey),
    ),
  ];
}
