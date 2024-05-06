import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../constants/dimens_constants.dart';
import '../../../controller/profile_controller.dart';
import '../../../widgets/app_container.dart';

class DishInfo extends StatelessWidget {
  const DishInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return AppContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.dish1NameController,
            decoration: const InputDecoration(label: Text("Dish 1 Name")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter dish 1 name";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.dish1DetailsController,
            decoration: const InputDecoration(hintText: "Dish 1 Details"),
            minLines: 5,
            maxLines: 200,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter dish 1 details";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.dish2NameController,
            decoration: const InputDecoration(label: Text("Dish 2 Name")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter dish 2 name";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.dish2DetailsController,
            decoration: const InputDecoration(hintText: "Dish 2 Details"),
            minLines: 5,
            maxLines: 200,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter dish 2 Details";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.dish3NameController,
            decoration: const InputDecoration(label: Text("Dish 3 Name")),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter dish 3 name";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
          TextFormField(
            controller: controller.dish3DetailsController,
            decoration: const InputDecoration(hintText: "Dish 3 Details"),
            minLines: 5,
            maxLines: 200,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter dish 3 Details";
              }
              return null;
            },
          ),
          Gap(DimensConstants.spaceBetweenViews),
        ],
      ),
    );
  }
}
