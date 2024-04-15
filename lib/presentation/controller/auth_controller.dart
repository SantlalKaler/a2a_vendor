import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  RxBool isOTPSent = false.obs;
  RxBool isResendOTP = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSendingOTP = false.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
}