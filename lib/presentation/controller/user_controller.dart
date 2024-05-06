import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t2p_vendor/domain/model/shop.dart';

class UserController extends GetxController {
  var box = GetStorage();

  String get deviceToken => box.read(GetStorageKey.deviceToken) ?? "";

  String get shopId => shopFromJson(box.read(GetStorageKey.shop)).id ?? "";

  Shop? get shop => shopFromJson(box.read(GetStorageKey.shop));

  saveDeviceToken(String value) {
    box.write(GetStorageKey.deviceToken, value);
  }

  saveShop(Shop shop) {
    box.write(GetStorageKey.shop, shopToJson(shop));
  }
}

class GetStorageKey {
  static String deviceToken = "deviceToken";
  static String shop = "shop";
}
