import 'package:a2a_vendor/presentation/theme/theme_light.dart';
import 'package:a2a_vendor/responsive.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (Responsive.isDesktop(context))
            Image.asset(
              ImageConstants.login,
              width: MediaQuery.of(context).size.width / 2,
            ),
          if (Responsive.isDesktop(context)) const Gap(20),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: Responsive.isDesktop(context)
                    ? const EdgeInsets.all(20)
                    : null,
                height: Responsive.height(context),
                width: double.infinity,
                decoration: Responsive.isDesktop(context)
                    ? BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20))
                    : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(40),
                      height: 300,
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
                              'India\'s Most Trusted Intercity Logistic Delivery Application',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
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
            ),
          ),
        ],
      ),
    ));
  }
}
