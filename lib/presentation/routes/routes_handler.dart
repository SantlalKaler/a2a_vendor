import 'package:a2a_vendor/presentation/controller/user_controller.dart';
import 'package:a2a_vendor/presentation/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'desktop_routes.dart';
import 'mobile_routes.dart';

class MyRoutes {
  GoRouter getMyRoutes(BuildContext context) {
    return GetPlatform.isMobile ? mobileRoutes : desktopRoutes;
  }
}

redirectToAuthScreenIfNotLoggedIn(BuildContext context, GoRouterState state) {
  UserController userController = Get.find();
  if (!userController.isLoggedIn) {
    return state.namedLocation(RoutesConstants.authScreen);
  } else {
    return null;
  }
}

redirectToHomeScreenIfLoggedIn(BuildContext context, GoRouterState state) {
  UserController userController = Get.find();
  if (userController.isLoggedIn) {
    return state.namedLocation(RoutesConstants.dashboardScreen);
  } else {
    return null;
  }
}
