import 'dart:io';

import 'package:a2a_vendor/presentation/constants/dimens_constants.dart';
import 'package:a2a_vendor/presentation/controller/product_controller.dart';
import 'package:a2a_vendor/presentation/widgets/circular_loadings.dart';
import 'package:a2a_vendor/presentation/widgets/custom_snackbar.dart';
import 'package:a2a_vendor/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/model/upload_image.dart';
import '../../constants/image_constants.dart';
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
                      if ((controller.selectedProduct != null &&
                                  controller.selectedProduct!.image == null ||
                              controller.selectedProduct!.image!.isEmpty) ||
                          (controller.selectedProduct == null &&
                              controller.uploadImages.isEmpty))
                        GestureDetector(
                            onTap: () async {
                              if (kIsWeb) {
                                await pickMultipleImagesFromGallery();
                              } else {
                                await showImagePickerOptions(context);
                              }
                            },
                            child: Image.asset(ImageConstants.addPhoto)),
                      if ((controller.selectedProduct != null &&
                          controller.selectedProduct!.image == null ||
                          controller.selectedProduct!.image!.isEmpty) ||
                          (controller.selectedProduct == null &&
                              controller.uploadImages.isEmpty))
                        Gap(DimensConstants.highSpacing),

                      // new image that user choose from gallery/camera
                      /*if (controller.uploadImages.isNotEmpty)
                        const Text("New Images"),*/
                      // Gap(DimensConstants.spaceBetweenViews),
                      if (controller.uploadImages.isNotEmpty)
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // itemCount: controller.uploadImages.length,
                          itemCount: 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing:
                                      DimensConstants.spaceBetweenViews,
                                  mainAxisSpacing:
                                      DimensConstants.spaceBetweenViews,
                                  childAspectRatio: 1,
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            var item = controller.uploadImages[0];
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: GetPlatform.isWeb
                                          ? DecorationImage(
                                              image:
                                                  MemoryImage(item.byteImage!))
                                          : DecorationImage(
                                              image:
                                                  FileImage(File(item.path)))),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                        onPressed: () {
                                          controller
                                              .removeUploadImageData(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                        )))
                              ],
                            );
                          },
                        ),

                      // Gap(DimensConstants.spaceBetweenViews),
                      // if (controller.selectedProduct != null &&
                      //     controller.selectedProduct!.image != null &&
                      //     controller.selectedProduct!.image!.isNotEmpty)
                      //   const Text("Older Images"),
                      if (controller.selectedProduct != null &&
                          controller.selectedProduct!.image != null &&
                          controller.selectedProduct!.image!.isNotEmpty)
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing:
                                      DimensConstants.spaceBetweenViews,
                                  mainAxisSpacing:
                                      DimensConstants.spaceBetweenViews,
                                  childAspectRatio: 1,
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            var item = controller.selectedProduct!.image!;
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(item))),
                            );
                          },
                        ),
                      Gap(DimensConstants.highSpacing),

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
                      DropdownMenu(
                        expandedInsets: EdgeInsets.zero,
                        dropdownMenuEntries: controller.categories
                            .map((element) => DropdownMenuEntry(
                                value: element.name, label: element.name!))
                            .toList(),
                        controller: controller.productCategory,
                        onSelected: (value) => setState(() {
                          controller.productCategory.text = value!;
                          controller.productSubCategory.clear();
                          controller.getSubCategories(value);
                        }),
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
                        onSelected: (value) => setState(() {
                          controller.productSubCategory.text = value!;
                        }),
                        label: const Text("Select Sub Category"),
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
                      TextFormField(
                        controller: controller.sellingPrice,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Selling Price",
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter selling price";
                        },
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      TextFormField(
                        controller: controller.discountedPrice,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Discounted Price",
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter discounted price";
                        },
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      TextFormField(
                        controller: controller.sku,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "SKU",
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter sku";
                        },
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      TextFormField(
                        controller: controller.length,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Product Length",
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter product length";
                        },
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      TextFormField(
                        controller: controller.width,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Product Width",
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter product width";
                        },
                      ),
                      Gap(DimensConstants.spaceBetweenViews),
                      TextFormField(
                        controller: controller.height,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Product Height",
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "Enter product height";
                        },
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
                      const Gap(100),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  showImagePickerOptions(BuildContext context) {
    ProductController controller = Get.find();
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        var imagePicker = ImagePicker();
        return SizedBox(
          height: 150,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  Get.back();
                  if (file != null) {
                    File fileImg = File(file.path);
                    int fileSizeInBytes =
                        await fileImg.length(); // Get file size in bytes
                    double fileSizeInKB =
                        fileSizeInBytes / 1024; // Convert bytes to KB
                    double fileSizeInMB = fileSizeInKB / 1024; //

                    if (fileSizeInMB > 5) {
                      CustomSnackBar.showSnackBar(
                          "Selected file is too large (exceeds 5 MB). Please choose a smaller file.");
                    } else {
                      controller.addUploadImageData(
                          UploadImage(name: file.name, path: file.path));
                    }
                  }
                },
                child: const ListTile(
                  title: Text("Camera"),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  Get.back();
                  if (file != null) {
                    File fileImg = File(file.path);
                    int fileSizeInBytes =
                        await fileImg.length(); // Get file size in bytes
                    double fileSizeInKB =
                        fileSizeInBytes / 1024; // Convert bytes to KB
                    double fileSizeInMB = fileSizeInKB / 1024; //

                    if (fileSizeInMB > 5) {
                      CustomSnackBar.showSnackBar(
                          "Selected file is too large (exceeds 5 MB). Please choose a smaller file.");
                    } else {
                      controller.addUploadImageData(
                          UploadImage(name: file.name, path: file.path));
                    }
                  }
                },
                child: const ListTile(
                  title: Text("Gallery"),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Future pickMultipleImagesFromGallery() async {
  ProductController controller = Get.find();
  List<XFile> images = await ImagePicker().pickMultiImage(imageQuality: 40);
  for (var i = 0; i < images.length; i++) {
    var image = images[i];

    controller.addUploadImageData(UploadImage(
        name: image.name,
        path: image.path,
        byteImage: await image.readAsBytes()));
  }
}
