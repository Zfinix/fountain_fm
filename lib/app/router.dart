import 'package:flutter/material.dart';
import 'package:fountain_fm/views/home/home_page.dart';
import 'package:fountain_fm/views/splash_page.dart';
import 'package:go_router/go_router.dart';

class FountainPages {
  static const splash = '/splash';
  static const home = '/home';
}

class FountainRouter {
  static final router = GoRouter(
    routes: _routes,
    initialLocation: FountainPages.splash,
    errorPageBuilder: _errorPageBuilder,
    urlPathStrategy: UrlPathStrategy.path,
    // the guard checks if the user is logged in
    //  redirect: (_) => Guard(_),
  );

  static Page<dynamic> _errorPageBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage<SplashPage>(
        key: state.pageKey,
        child: const SplashPage(),
      );

  // the routes when the user is logged in
  static final _routes = [
    GoRoute(
      path: FountainPages.splash,
      pageBuilder: (context, state) => MaterialPage<SplashPage>(
        key: state.pageKey,
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: FountainPages.home,
      pageBuilder: (context, state) {
        return MaterialPage<HomePage>(
          key: state.pageKey,
          child: const HomePage(),
        );
      },
    ),
  ];
}

class Guard {
  final GoRouterState state;
  Guard(this.state);
}
