import 'package:get/get.dart';
import 'package:t2p_vendor/presentation/controller/user_controller.dart';

import '../../data/api_services.dart';
import '../../data/app_urls.dart';
import '../../domain/model/single_filter_item.dart';

class OrderController extends GetxController {
  RxBool isLoading = false.obs;

  setLoading() => isLoading.value = !isLoading.value;

  var chipList = [
    FilterItem(title: "Start Date", id: FilterItemId.startDate),
    FilterItem(title: "End Date", id: FilterItemId.endDate),
  ];

  ApiService apiService = ApiService();

  Future getOrders() async {
    UserController userController = Get.find();
    try {
      setLoading();
      var response = await apiService.post(AppUrls.shopGetOrders, {},
          hasQueryParam: true,
          queryParam: {
            "id": userController.shopId,
            "orderid": "",
            /*"limit": "",
        "page":""*/
          });

      if (response != null && response.data['status'] == 'success') {
        // save user
        // move to dashboard
      }
    } finally {
      setLoading();
    }
  }
}
