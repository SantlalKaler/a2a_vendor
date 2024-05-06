import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:t2p_vendor/presentation/constants/dimens_constants.dart';
import 'package:t2p_vendor/presentation/controller/profile_controller.dart';

import '../../../widgets/app_container.dart';

class ShopLocationInfo extends StatelessWidget {
  const ShopLocationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileController(),
        builder: (controller) {
          return AppContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.addressController,
                  maxLines: 10,
                  minLines: 2,
                  decoration: const InputDecoration(labelText: "Address"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter address";
                    }
                    return null;
                  },
                ),
                Gap(DimensConstants.spaceBetweenViews),
                DropdownMenu(
                  controller: controller.countryController,
                  expandedInsets: const EdgeInsets.all(0),
                  hintText: "Select Country",
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: "India", label: "India")
                  ],
                  onSelected: (value) {
                  },
                ),
                Gap(DimensConstants.spaceBetweenViews),
                DropdownMenu(
                    hintText: "Select State",
                    controller: controller.stateController,
                    expandedInsets: const EdgeInsets.all(0),
                    onSelected: (value) {
                      controller.cityController.clear();
                      controller.pincodeController.clear();
                      controller.getCityList();
                    },
                    dropdownMenuEntries: controller.states
                        .map((element) => DropdownMenuEntry(
                            value: element.name, label: element.name!))
                        .toList()),
                Gap(DimensConstants.spaceBetweenViews),
                DropdownMenu(
                    hintText: "Select City",
                    controller: controller.cityController,
                    expandedInsets: const EdgeInsets.all(0),
                    onSelected: (value) {
                      controller.pincodeController.clear();
                      controller.getZipList();
                    },
                    dropdownMenuEntries: controller.cities
                        .map((element) => DropdownMenuEntry(
                            value: element.name, label: element.name!))
                        .toList()),
                Gap(DimensConstants.spaceBetweenViews),
                DropdownMenu(
                    hintText: "Select Pincode",
                    controller: controller.pincodeController,
                    expandedInsets: const EdgeInsets.all(0),
                    onSelected: (value) {},
                    dropdownMenuEntries: controller.zips
                        .map((element) => DropdownMenuEntry(
                            value: element.name, label: element.name!))
                        .toList()),
                Gap(DimensConstants.spaceBetweenViews),
                TextFormField(
                  controller: controller.postOfficeController,
                  decoration: const InputDecoration(labelText: "Post Office"),
                ),
                Gap(DimensConstants.spaceBetweenViews),
                TextFormField(
                  controller: controller.landmarkController,
                  decoration:
                      const InputDecoration(labelText: "Landmark(Optional)"),
                ),
                Gap(DimensConstants.spaceBetweenViews),
                TextFormField(
                  controller: controller.address2Controller,
                  maxLines: 10,
                  minLines: 2,
                  decoration: const InputDecoration(
                      labelText: "Address 2(Choose from map)"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter address";
                    }
                    return null;
                  },
                ),
              ],
            ),
          );
        });
  }
}
