import 'dart:async';

import 'package:a2a_vendor/presentation/constants/image_constants.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../controller/user_controller.dart';
import '../routes/routes_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  UserController userController = Get.find();

  void _getToken() async {
    if (userController.deviceToken.isEmpty) {
      String? token = await messaging.getToken();
      userController.saveDeviceToken(token!);
      printInfo(info: 'Device Token: $token');
    }
  }

  @override
  void initState() {
    _getToken();

    Timer(const Duration(milliseconds: 500), () {
      if (userController.isLoggedIn) {
        context.pushReplacement(RoutesConstants.dashboardScreen);
      } else {
        context.pushReplacement(RoutesConstants.authScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Image.asset(ImageConstants.splashScreen, fit: BoxFit.cover,));
  }
}
