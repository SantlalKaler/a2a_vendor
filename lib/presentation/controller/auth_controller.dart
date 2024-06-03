import 'package:a2a_vendor/data/app_urls.dart';
import 'package:a2a_vendor/domain/model/shop.dart';
import 'package:a2a_vendor/presentation/controller/user_controller.dart';
import 'package:a2a_vendor/presentation/routes/routes_constants.dart';
import 'package:a2a_vendor/presentation/widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../data/api_services.dart';
import '../constants/constants.dart';

class AuthController extends GetxController {
  RxBool isOTPSent = false.obs;
  RxBool isResendOTP = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSendingOTP = false.obs;

  setLoading() => isLoading.value = !isLoading.value;

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  ApiService apiService = ApiService();
  UserController userController = Get.find();

  Future sendOtp() async {
    try {
      setLoading();
      var response = await apiService.post(AppUrls.shopLogin, {
        "mobile": phoneController.text,
        "device_token": userController.deviceToken,
        "device_type": GetPlatform.isAndroid ? "android" : "ios"
      });

      if (response != null && response.data['status'] == 'success') {
        isOTPSent.value = true;
        printValue(response.data);
      }else{
        CustomSnackBar.showSnackBar(response?.data['message']);
      }
    } finally {
      setLoading();
    }
  }

  Future verifyOtp(BuildContext context) async {
    try {
      setLoading();
      var response = await apiService.post(AppUrls.shopVerifyOtp, {
        "mobile": phoneController.text,
        "otp": otpController.text,
        "device_token": userController.deviceToken
      });

      if (response != null && response.data['status'] == 'success') {
        // save user
        userController.saveShop(Shop.fromJson(response.data['data']));
        // move to dashboard
        if (context.mounted) {
          context.pushReplacement(RoutesConstants.dashboardScreen);
        }
      }
    } finally {
      setLoading();
    }
  }
}
