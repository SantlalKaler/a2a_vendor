import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../constants/dimens_constants.dart';
import '../../../controller/profile_controller.dart';
import '../../../widgets/app_container.dart';

class ShopInfo extends StatelessWidget {
  const ShopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return AppContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.nameController,
            decoration: const InputDecoration(label: Text("Full Name")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter full name";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(label: Text("Email")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter email";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.mobileController,
            decoration: const InputDecoration(label: Text("Mobile")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter mobile";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.mobile2Controller,
            decoration: const InputDecoration(label: Text("Mobile 2")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter mobile";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.mobile3Controller,
            decoration: const InputDecoration(label: Text("Mobile 3")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter mobile";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.shopDescController,
            decoration: const InputDecoration(hintText: "Shop Description"),
            maxLines: 20,
            minLines: 5,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter mobile";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
