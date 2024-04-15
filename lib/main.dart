import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t2p_vendor/presentation/constants/string_constants.dart';
import 'package:t2p_vendor/presentation/controller/auth_controller.dart';
import 'package:t2p_vendor/presentation/controller/dashboard_controller.dart';
import 'package:t2p_vendor/presentation/screens/splash_screen.dart';
import 'package:t2p_vendor/presentation/theme/theme_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      themeMode: ThemeMode.light,
      theme: LightTheme.getTheme(),
      home: const SplashScreen(),
      initialBinding: InitialBindings(),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(DashboardController());
  }
}
