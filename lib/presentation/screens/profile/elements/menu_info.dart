import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t2p_vendor/domain/model/upload_image.dart';
import 'package:t2p_vendor/presentation/constants/image_constants.dart';
import 'package:t2p_vendor/presentation/controller/user_controller.dart';

import '../../../../domain/model/menu.dart';
import '../../../constants/dimens_constants.dart';
import '../../../controller/profile_controller.dart';
import '../../../widgets/app_container.dart';

class MenuInfo extends StatelessWidget {
  const MenuInfo({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    List<Menu>? olderImages = userController.shop?.menu;
    return GetBuilder(
      init: ProfileController(),
      builder: (controller) {
        return AppContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () async {
                    await showImagePickerOptions(context);
                  },
                  child: Image.asset(ImageConstants.addPhoto)),
              Gap(DimensConstants.spaceBetweenViews),

              // new image that user choose from gallery/camera
              if (controller.uploadImages.isNotEmpty) const Text("New Images"),
              Gap(DimensConstants.spaceBetweenViews),
              if (controller.uploadImages.isNotEmpty)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.uploadImages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: DimensConstants.spaceBetweenViews,
                      mainAxisSpacing: DimensConstants.spaceBetweenViews,
                      childAspectRatio: 1,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    var item = controller.uploadImages[index];
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: FileImage(File(item.path)))),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  controller.removeUploadImageData(index);
                                },
                                icon: const Icon(Icons.delete, color: Colors.redAccent,)))
                      ],
                    );
                  },
                ),

              // old image that user already uploaded
              Gap(DimensConstants.spaceBetweenViews),
              if (olderImages != null && olderImages.isNotEmpty)
                const Text("Older Images"),
              if (olderImages != null && olderImages.isNotEmpty)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: olderImages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: DimensConstants.spaceBetweenViews,
                      mainAxisSpacing: DimensConstants.spaceBetweenViews,
                      childAspectRatio: 1,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    var item = olderImages[index];
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image:
                              DecorationImage(image: NetworkImage(item.location!))),
                    );
                  },
                )
            ],
          ),
        );
      }
    );
  }

  showImagePickerOptions(BuildContext context) {
    ProfileController controller = Get.find();
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        var imagePicker = ImagePicker();
        return Container(
          height: 150,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  if (file != null) {
                    controller.addUploadImageData(
                        UploadImage(name: file.name, path: file.path));
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
                  if (file != null) {
                    controller.addUploadImageData(
                        UploadImage(name: file.name, path: file.path));
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
