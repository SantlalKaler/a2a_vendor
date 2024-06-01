import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:a2a_vendor/presentation/controller/profile_controller.dart';

import '../../../constants/dimens_constants.dart';
import '../../../widgets/app_container.dart';

class BankInfo extends StatelessWidget {
  const BankInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return AppContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.accountNumberController,
            decoration: const InputDecoration(label: Text("A/C Number")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter account number";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.bankNameController,
            decoration: const InputDecoration(label: Text("Bank Name")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter bank name";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.ifscCodeController,
            decoration: const InputDecoration(label: Text("IFSC Code")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter Ifsc code";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.accHolderNameController,
            decoration:
                const InputDecoration(label: Text("Account Holder Name")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter account holder name";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.upiIdController,
            decoration: const InputDecoration(label: Text("UPI Id")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter UPI Id";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
