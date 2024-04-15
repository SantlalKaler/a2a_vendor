import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../constants/dimens_constants.dart';
import '../../widgets/app_container.dart';
import 'edit_profile.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  //UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title: const Text("My Profile"),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios))),
        body:Padding(
          padding: EdgeInsets.all(DimensConstants.screePadding),
          child: Column(
            children: [
              AppContainer(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Xa Kaler",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "\nxakaler@gmail.com\n9876543210",
                  ),
                  Gap(DimensConstants.spaceBetweenViews),
                  Row(
                    children: [
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.to(const EditProfileScreen());
                            },
                            child: const Text(
                              "Edit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ))
                    ],
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
