import 'package:get/get.dart';

import '../../data/api_services.dart';
import '../../data/app_urls.dart';

class SettingController extends GetxController {
  RxBool isLoading = false.obs;

  setLoading() => isLoading.value = !isLoading.value;
  RxString about = "".obs;

  ApiService apiService = ApiService();

  Future getSettings() async {
    try {
      setLoading();
      var response = await apiService.post(AppUrls.settings, {});

      if (response != null && response.data['status'] == 'success') {
        about.value = response.data?['result']['about_us'];
      }
    } finally {
      setLoading();
      update();
    }
  }
}
