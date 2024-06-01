import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:a2a_vendor/domain/model/shop.dart';

class UserController extends GetxController {
  var box = GetStorage();

  String get deviceToken => box.read(GetStorageKey.deviceToken) ?? "";

  String get shopId => shopFromJson(box.read(GetStorageKey.shop)).id ?? "";

  bool get isLoggedIn => box.read(GetStorageKey.isLoggedIn) ?? false;

  Shop? get shop => shopFromJson(box.read(GetStorageKey.shop));

  saveDeviceToken(String value) {
    box.write(GetStorageKey.deviceToken, value);
  }

  saveShop(Shop shop) {
    box.write(GetStorageKey.shop, shopToJson(shop));
    box.write(GetStorageKey.isLoggedIn, true);
  }

  clearShop() {
    box.remove(GetStorageKey.shop);
    box.remove(GetStorageKey.isLoggedIn);
  }
}

class GetStorageKey {
  static String deviceToken = "deviceToken";
  static String shop = "shop";
  static String isLoggedIn = "isLoggedIn";
}
