import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t2p_vendor/presentation/constants/string_constants.dart';
import 'package:t2p_vendor/presentation/controller/auth_controller.dart';
import 'package:t2p_vendor/presentation/controller/conectivity_controller.dart';
import 'package:t2p_vendor/presentation/controller/dashboard_controller.dart';
import 'package:t2p_vendor/presentation/controller/order_controller.dart';
import 'package:t2p_vendor/presentation/controller/product_controller.dart';
import 'package:t2p_vendor/presentation/controller/profile_controller.dart';
import 'package:t2p_vendor/presentation/controller/setting_controller.dart';
import 'package:t2p_vendor/presentation/controller/user_controller.dart';
import 'package:t2p_vendor/presentation/firebase_options.dart';
import 'package:t2p_vendor/presentation/screens/splash_screen.dart';
import 'package:t2p_vendor/presentation/theme/theme_light.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
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
