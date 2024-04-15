import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/image_constants.dart';
import '../../controller/auth_controller.dart';
import 'elements/enter_otp.dart';
import 'elements/enter_phone.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();

    return Scaffold(
        body: Obx(
      () => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              height: 350,
              width: double.infinity,
              child: Center(
                child: Image.asset(
                  ImageConstants.appLogoCircle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    Text(
                      'India\'s Most Trusted Intercity Food Delivery Application',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    authController.isOTPSent.isFalse
                        ? const EnterPhoneWidget()
                        : const EnterOtpWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
