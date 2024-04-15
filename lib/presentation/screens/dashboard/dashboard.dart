import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:t2p_vendor/presentation/screens/auth/auth_screen.dart';

import '../../constants/dimens_constants.dart';
import '../../controller/dashboard_controller.dart';
import '../../dialogs/default_dialog.dart';
import '../about_screen.dart';
import '../order/order_list.dart';
import '../profile/my_profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  DashboardController controller = Get.find();
  late AnimationController animationController;
  late List<Animation<Offset>> slideAnimations;

  @override
  void initState() {
    var itemLength = controller.vendorDashboardItems.length;
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slideAnimations = List.generate(
        itemLength,
        (index) => Tween(begin: const Offset(-2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(index * (1 / itemLength), 1))));

    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            leading: const SizedBox.shrink(),
            title: const Text("Hello"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DefaultDialog(
                            icon: const Icon(
                              Icons.logout,
                              size: 50,
                            ),
                            message: "Do you really want to log out?",
                            btn1Txt: "Confirm",
                            btn1Click: () {
                              Get.to(const AuthScreen());
                            },
                            btn2Txt: "Cancel",
                            btn2Click: () {
                              Get.back();
                              Get.back();
                            },
                          );
                        });
                  },
                  icon: const Icon(Icons.logout))
            ]),
        body: Padding(
          padding: EdgeInsets.all(DimensConstants.screePadding),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              // here dashboard items are change according to user type
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                    controller.vendorDashboardItems.length,
                    (index) => SlideTransition(
                          position: slideAnimations[index],
                          child: InkWell(
                            onTap: () {
                              switch (
                                  controller.vendorDashboardItems[index].id) {
                                case DashboardItemId.myOrders:
                                  Get.to(() => const OrderList());
                                case DashboardItemId.myProfile:
                                  Get.to(() => const MyProfileScreen());
                                case DashboardItemId.about:
                                  Get.to(() => const AboutScreen());
                              }
                            },
                            child: singleGridItem(
                                controller.vendorDashboardItems[index]),
                          ),
                        )),
              )),
        ));
  }
}

singleGridItem(DashboardItem item) {
  return SizedBox(
    height: 70,
    child: Column(
      children: [
        Image.asset(item.icon, width: double.infinity, height: 100),
        const Gap(10),
        Text(item.title),
        const Gap(10),
        const Divider(
          thickness: 1,
        )
      ],
    ),
  );
}
