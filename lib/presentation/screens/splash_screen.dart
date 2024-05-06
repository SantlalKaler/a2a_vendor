import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t2p_vendor/presentation/constants/image_constants.dart';
import 'package:t2p_vendor/presentation/screens/auth/auth_screen.dart';
import 'package:t2p_vendor/presentation/screens/dashboard/dashboard.dart';

import '../controller/user_controller.dart';

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
      if (userController.shop != null) {
        Get.to(const DashboardScreen());
      } else {
        Get.to(const AuthScreen());
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
        child: Image.asset(ImageConstants.splashScreen));
  }
}
