import 'package:a2a_vendor/presentation/routes/routes_constants.dart';
import 'package:a2a_vendor/presentation/routes/routes_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/splash_screen.dart';

var desktopRoutes = GoRouter(
  navigatorKey: Get.key,
  initialLocation: RoutesConstants.splashScreen,
  routes: <RouteBase>[
    GoRoute(
      path: RoutesConstants.splashScreen,
      name: RoutesConstants.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: RoutesConstants.authScreen,
      path: RoutesConstants.authScreen,
      builder: (context, state) => const AuthScreen(),
      redirect: (BuildContext context, GoRouterState state) {
        return redirectToHomeScreenIfLoggedIn(context, state);
      },
    ),
  ],
);
