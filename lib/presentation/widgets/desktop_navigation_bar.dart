import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DeskTopNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<Widget> items;
  final ValueChanged<int>? onTap;
  final bool? showCartIcon;
  final bool? showWishListIcon;
  final bool? showVegNonVegToggel;

  const DeskTopNavigationBar(
      {super.key,
      required this.items,
      this.onTap,
      this.showCartIcon,
      this.showWishListIcon,
      this.showVegNonVegToggel});

  @override
  Widget build(BuildContext context) {
 /*   SettingsController settingsController = Get.find();
    AuthController authController = Get.find();
    SavedLocationController savedLocationController = Get.find();
    ProductsController productsController = Get.find();
    HomeController homeController = Get.find();
    WishlistController wishlistController = Get.find();
    CartController cartController = Get.find();*/

    return Obx(() => Stack(
          children: [
            AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black87),
              iconTheme: const IconThemeData(color: Colors.black87, size: 18),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                      },)
                  // const Text('Refer & Earn'),
                  // const Gap(20),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kToolbarHeight);

  Future<void> _openStore(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
