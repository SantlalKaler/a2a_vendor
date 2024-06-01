import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:a2a_vendor/presentation/controller/setting_controller.dart';
import 'package:a2a_vendor/presentation/widgets/app_container.dart';
import 'package:a2a_vendor/presentation/widgets/circular_loadings.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  SettingController settingController = Get.find();

  @override
  void initState() {
    settingController.getSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("About"),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios))),
      body: GetBuilder<SettingController>(
          init: SettingController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: controller.isLoading.isTrue
                  ? Center(child: circularloadingRedSmall())
                  : AppContainer(
                      child: SingleChildScrollView(
                          child: HtmlWidget(
                        controller.about.value,
                        textStyle: const TextStyle( wordSpacing: 1, fontSize: 16),
                      )),
                    ),
            );
          }),
    );
  }
}
