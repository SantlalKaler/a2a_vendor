import 'package:a2a_vendor/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:a2a_vendor/presentation/controller/profile_controller.dart';
import 'package:a2a_vendor/presentation/screens/profile/elements/shop_location_info.dart';
import 'package:a2a_vendor/presentation/widgets/circular_loadings.dart';

import '../../constants/dimens_constants.dart';
import 'elements/bank_info.dart';
import 'elements/dish_info.dart';
import 'elements/menu_info.dart';
import 'elements/shop_info.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  ProfileController controller = Get.find();

  @override
  void initState() {
    controller.setDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Profile"),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios))),
        bottomSheet: Padding(
          padding: EdgeInsets.all(DimensConstants.screePadding),
          child: Obx(() => AppElevatedButton(
              onPressed: () {
                controller.updateShop();
              },
              child: controller.isLoading.isTrue
                  ? circularloadingWhiteSmall()
                  : const Text("Save Details"))),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(DimensConstants.screePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shop Info",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(DimensConstants.spaceBetweenViews),
                  const ShopInfo(),
                  Gap(DimensConstants.spaceBetweenViews),
                  const Text(
                    "Shop Location",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(DimensConstants.spaceBetweenViews),
                  const ShopLocationInfo(),
                  Gap(DimensConstants.spaceBetweenViews),
                  const Text(
                    "Bank Info",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(DimensConstants.spaceBetweenViews),
                  const BankInfo(),
                  Gap(DimensConstants.spaceBetweenViews),
                  const Text(
                    "Dish Info",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(DimensConstants.spaceBetweenViews),
                  const DishInfo(),
                  Gap(DimensConstants.spaceBetweenViews),
                  const Text(
                    "Menus",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(DimensConstants.spaceBetweenViews),
                  const MenuInfo(),
                  const Gap(100),
                ],
              ),
            ),
          ),
        ));
  }
}
