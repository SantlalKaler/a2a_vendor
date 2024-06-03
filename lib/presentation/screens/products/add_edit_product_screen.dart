import 'package:a2a_vendor/responsive.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:a2a_vendor/presentation/constants/dimens_constants.dart';
import 'package:a2a_vendor/presentation/controller/product_controller.dart';
import 'package:a2a_vendor/presentation/controller/profile_controller.dart';
import 'package:a2a_vendor/presentation/widgets/circular_loadings.dart';
import 'package:a2a_vendor/presentation/widgets/custom_snackbar.dart';

import '../../../domain/model/ProductListResponse.dart';
import '../../widgets/app_button.dart';

class AddEditProductScreen extends StatefulWidget {
  const AddEditProductScreen({super.key});

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  ProductController controller = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    controller.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "${controller.selectedProduct == null ? "Add" : "Edit"} Product"),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios))),
      bottomSheet: Padding(
        padding: Responsive.isMobile(context)
            ? EdgeInsets.all(DimensConstants.screePadding)
            : EdgeInsets.symmetric(
                horizontal: DimensConstants.desktopScreePadding,
                vertical: DimensConstants.screePadding),
        child: Obx(() => AppElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  controller.productCategory.text.isNotEmpty &&
                  controller.productSubCategory.text.isNotEmpty) {
                if (controller.selectedProduct == null) {
                  controller.addProduct();
                } else {
                  controller.updateProduct();
                }
              } else {
                CustomSnackBar.showSnackBar("Fill all details");
              }
            },
            child: controller.isLoading.isTrue
                ? circularloadingWhiteSmall()
                : const Text("Submit"))),
      ),
      body: GetBuilder(
          init: ProductController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: Responsive.isMobile(context)
                    ? EdgeInsets.all(DimensConstants.screePadding)
                    : EdgeInsets.symmetric(
                        horizontal: DimensConstants.desktopScreePadding,
                        vertical: DimensConstants.screePadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.productName,
                        decoration: const InputDecoration(
                          labelText: "Product Name",
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter product name";
                        },
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      TextFormField(
                        controller: controller.productWeight,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Product Weight",
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter product weight";
                        },
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      DropdownMenu(
                        expandedInsets: EdgeInsets.zero,
                        dropdownMenuEntries: controller.categories
                            .map((element) => DropdownMenuEntry(
                                value: element.name, label: element.name!))
                            .toList(),
                        controller: controller.productCategory,
                        label: const Text("Select Category"),
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      DropdownMenu(
                        expandedInsets: EdgeInsets.zero,
                        dropdownMenuEntries: controller.subCategories
                            .map((element) => DropdownMenuEntry(
                                value: element.name, label: element.name!))
                            .toList(),
                        controller: controller.productSubCategory,
                        label: const Text("Select Sub Category"),
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      TextFormField(
                        controller: controller.productDescription,
                        minLines: 4,
                        maxLines: 200,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter product description";
                        },
                        decoration: const InputDecoration(
                          labelText: "Product Description",
                        ),
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
