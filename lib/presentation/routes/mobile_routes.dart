import 'package:a2a_vendor/presentation/routes/routes_constants.dart';
import 'package:a2a_vendor/presentation/routes/routes_handler.dart';
import 'package:a2a_vendor/presentation/screens/about_screen.dart';
import 'package:a2a_vendor/presentation/screens/dashboard/dashboard.dart';
import 'package:a2a_vendor/presentation/screens/order/order_list.dart';
import 'package:a2a_vendor/presentation/screens/products/my_product_screen.dart';
import 'package:a2a_vendor/presentation/screens/profile/edit_profile.dart';
import 'package:a2a_vendor/presentation/screens/profile/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/products/add_edit_product_screen.dart';
import '../screens/splash_screen.dart';

var mobileRoutes = GoRouter(
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
    GoRoute(
        name: RoutesConstants.dashboardScreen,
        path: RoutesConstants.dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: RoutesConstants.myProfileScreen,
            name: RoutesConstants.myProfileScreen,
            builder: (context, state) => const EditProfileScreen(),
          ),
          GoRoute(
            path: RoutesConstants.myOrderScreen,
            name: RoutesConstants.myOrderScreen,
            builder: (context, state) => const OrderList(),
          ),
          GoRoute(
            path: RoutesConstants.myProductScreen,
            name: RoutesConstants.myProductScreen,
            builder: (context, state) => const MyProductScreen(),
          ),
          GoRoute(
            path: RoutesConstants.addProductScreen,
            name: RoutesConstants.addProductScreen,
            builder: (context, state) => const AddEditProductScreen(),
          ),
          GoRoute(
            path: RoutesConstants.aboutUsScreen,
            name: RoutesConstants.aboutUsScreen,
            builder: (context, state) => const AboutScreen(),
          ),
        ]),
  ],
);
