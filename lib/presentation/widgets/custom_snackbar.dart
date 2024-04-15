import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static showSnackBar(String? message) {
    return ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message ?? "Something went wrong. Try again!")));
  }
}
