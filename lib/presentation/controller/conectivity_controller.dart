import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../widgets/custom_snackbar.dart';

class ConnectivityController extends GetxController {
  var isInternetAvailable = true.obs;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isInternetAvailable.value = false;
        CustomSnackBar.showSnackBar('No connection available');
      } else {
        if (isInternetAvailable.isFalse) {
          CustomSnackBar.showSnackBar('Connection restored');
        }
        isInternetAvailable.value = true;
      }
    });
  }
}
