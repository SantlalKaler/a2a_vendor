import 'package:a2a_vendor/presentation/controller/user_controller.dart';
import 'package:a2a_vendor/presentation/routes/routes_constants.dart';
import 'package:a2a_vendor/presentation/screens/auth/auth_screen.dart';
import 'package:a2a_vendor/responsive.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../constants/dimens_constants.dart';
import '../../controller/dashboard_controller.dart';
import '../../dialogs/default_dialog.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  DashboardController controller = Get.find();
  UserController userController = Get.find();
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
            title: Text("Hello ${userController.shop?.fullName}"),
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
              child: GridView.builder(
                itemCount: controller.vendorDashboardItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: Responsive.isMobile(context) ? 1 : 2.5,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => SlideTransition(
                  position: slideAnimations[index],
                  child: InkWell(
                    onTap: () {
                      switch (controller.vendorDashboardItems[index].id) {
                        case DashboardItemId.myProfile:
                          context.goNamed(RoutesConstants.myProfileScreen);
                        case DashboardItemId.myOrders:
                          context.pushNamed(RoutesConstants.myOrderScreen);
                        case DashboardItemId.myProducts:
                          context.pushNamed(RoutesConstants.myProductScreen);
                        case DashboardItemId.about:
                          context.pushNamed(RoutesConstants.aboutUsScreen);
                      }
                    },
                    child: singleGridItem(
                        context, controller.vendorDashboardItems[index]),
                  ),
                ),
              )),
        ));
  }
}

singleGridItem(BuildContext context, DashboardItem item) {
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
