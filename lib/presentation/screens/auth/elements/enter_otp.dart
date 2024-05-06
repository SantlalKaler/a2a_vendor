import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:t2p_vendor/presentation/widgets/title_divider.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../controller/auth_controller.dart';
import '../../../widgets/circular_loadings.dart';
import '../../../widgets/custom_snackbar.dart';

class EnterOtpWidget extends StatelessWidget {
  const EnterOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();

    return Obx(() => Column(
          children: [
            const TitleDividerSmall(title: 'Enter OTP'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'We have sent a verification code to'.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '+91-${authController.phoneController.text}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 16,
            ),
            OtpTextField(
              fieldWidth: 45,

              numberOfFields: 6,
              filled: true,
              enabledBorderColor:
                  Theme.of(context).primaryColor.withOpacity(0.1),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              focusedBorderColor:
                  Theme.of(context).primaryColor.withOpacity(0.5),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                authController.otpController.text = verificationCode;
              }, // end onSubmit
            ),
            const SizedBox(
              height: 8,
            ),
            authController.isResendOTP.isFalse
                ? Countdown(
                    seconds: 30,
                    build: (BuildContext context, double time) =>
                        Text('Resend or Edit in ${time.toStringAsFixed(0)}'),
                    interval: const Duration(milliseconds: 100),
                    onFinished: () {
                      authController.isResendOTP.value = true;
                    },
                  )
                : InkWell(
                    onTap: () {
                      authController.isOTPSent.value = false;
                    },
                    child: Text(
                      'Resend or Edit?',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 13),
                    )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (authController.otpController.text.length < 6) {
                  CustomSnackBar.showSnackBar("Enter Valid OTP");
                } else {

                  authController.verifyOtp();
                }
              },
              child: authController.isLoading.isTrue
                  ? circularloadingWhiteSmall()
                  : const Text('Verify'),
            ),
          ],
        ));
  }
}
