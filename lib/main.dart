import 'package:a2a_vendor/presentation/constants/string_constants.dart';
import 'package:a2a_vendor/presentation/controller/auth_controller.dart';
import 'package:a2a_vendor/presentation/controller/conectivity_controller.dart';
import 'package:a2a_vendor/presentation/controller/dashboard_controller.dart';
import 'package:a2a_vendor/presentation/controller/order_controller.dart';
import 'package:a2a_vendor/presentation/controller/product_controller.dart';
import 'package:a2a_vendor/presentation/controller/profile_controller.dart';
import 'package:a2a_vendor/presentation/controller/setting_controller.dart';
import 'package:a2a_vendor/presentation/controller/user_controller.dart';
import 'package:a2a_vendor/presentation/routes/routes_handler.dart';
import 'package:a2a_vendor/presentation/theme/theme_light.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kReleaseMode) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      themeMode: ThemeMode.light,
      theme: LightTheme.getTheme(),
      routerDelegate: MyRoutes().getMyRoutes(context).routerDelegate,
      navigatorObservers: <NavigatorObserver>[observer],
      backButtonDispatcher:
          MyRoutes().getMyRoutes(context).backButtonDispatcher,
      routeInformationParser:
          MyRoutes().getMyRoutes(context).routeInformationParser,
      routeInformationProvider:
          MyRoutes().getMyRoutes(context).routeInformationProvider,
      initialBinding: InitialBindings(),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(AuthController());
    Get.put(SettingController());
    Get.put(ProfileController());
    Get.put(ProductController());
    Get.put(OrderController());
    Get.put(DashboardController());
    Get.put(ConnectivityController());
  }
}
