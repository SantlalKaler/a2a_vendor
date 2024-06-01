import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../constants/image_constants.dart';

class DashboardController extends GetxController {
  List<DashboardItem> vendorDashboardItems = [
    DashboardItem(
        "My Profile", ImageConstants.myProfile, DashboardItemId.myProfile),
    DashboardItem(
        "My Orders", ImageConstants.myOrder, DashboardItemId.myOrders),
    DashboardItem(
        "My Products", ImageConstants.myProduct, DashboardItemId.myProducts),
    DashboardItem(
        "About Us", ImageConstants.aboutUs, DashboardItemId.about),
  ];
}

class DashboardItem {
  final String icon;
  final String title;
  final DashboardItemId id;

  const DashboardItem(
      this.title,
      this.icon,
      this.id,
      );
}

enum DashboardItemId {
  myProfile,
  myOrders,
  myProducts,
  about,
}

