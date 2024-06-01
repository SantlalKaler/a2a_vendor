import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:a2a_vendor/domain/model/ZipListResponse.dart';
import 'package:a2a_vendor/domain/model/city.dart';
import 'package:a2a_vendor/domain/model/state.dart';
import 'package:a2a_vendor/domain/model/upload_image.dart';
import 'package:a2a_vendor/presentation/controller/user_controller.dart';

import '../../data/api_services.dart';
import '../../data/app_urls.dart';
import 'package:dio/dio.dart' as dio;

import '../../domain/model/StateListResponse.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

  setLoading() => isLoading.value = !isLoading.value;
  RxList<IndState> states = RxList<IndState>();
  RxList<City> cities = RxList<City>();
  RxList<Zip> zips = RxList<Zip>();
  RxList<UploadImage> uploadImages = RxList<UploadImage>();
  String selectedState = "";
  String selectedCity = "";
  String selectedZipCode = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController mobile2Controller = TextEditingController();
  TextEditingController mobile3Controller = TextEditingController();
  TextEditingController shopDescController = TextEditingController();

  // address
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController postOfficeController = TextEditingController();

  // a/c details
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController accHolderNameController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();

  // dish details
  TextEditingController dish1NameController = TextEditingController();
  TextEditingController dish1DetailsController = TextEditingController();
  TextEditingController dish2NameController = TextEditingController();
  TextEditingController dish2DetailsController = TextEditingController();
  TextEditingController dish3NameController = TextEditingController();
  TextEditingController dish3DetailsController = TextEditingController();

  ApiService apiService = ApiService();
  UserController userController = Get.find();

  addUploadImageData(UploadImage image) {
    uploadImages.add(image);
    update();
  }

  removeUploadImageData(int index) {
    uploadImages.removeAt(index);
    update();
  }

  setDetails() async {
    await getStateList();
    var shop = userController.shop!;
    nameController.text = shop.shopName ?? "";
    emailController.text = shop.email ?? "";
    mobileController.text = shop.mobile ?? "";
    mobile2Controller.text = shop.mobile2 ?? "";
    mobile3Controller.text = shop.mobile3 ?? "";
    shopDescController.text = shop.shopDescription ?? "";

    addressController.text = shop.address ?? "";
    address2Controller.text = shop.address2 ?? "";
    countryController.text = shop.country ?? "";
    if (shop.state?.isNotEmpty == true) {
      stateController.text = getStateNameFromId(shop.state ?? "");
    }
    if (shop.city?.isNotEmpty == true) {
      cityController.text = getCityNameFromId(shop.city ?? "");
      getZipList();
    }
    pincodeController.text = shop.pincode ?? "";
    landmarkController.text = shop.landmark ?? "";
    postOfficeController.text = shop.postOffice ?? "";

    accountNumberController.text = shop.bankDetails?.accNo ?? "";
    bankNameController.text = shop.bankDetails?.bankName ?? "";
    ifscCodeController.text = shop.bankDetails?.ifscCode ?? "";
    accHolderNameController.text = shop.bankDetails?.accHolderName ?? "";
    upiIdController.text = shop.upiId ?? "";

    // dish
    dish1NameController.text = shop.dish1 ?? "";
    dish1DetailsController.text = shop.detail1 ?? "";
    dish2NameController.text = shop.dish2 ?? "";
    dish2DetailsController.text = shop.detail2 ?? "";
    dish3NameController.text = shop.dish3 ?? "";
    dish3DetailsController.text = shop.detail3 ?? "";
  }

  getStateNameFromId(String id) {
    selectedState = states.firstWhere((element) => element.id == id).name!;
    return selectedState;
  }

  getCityNameFromId(String id) {
    selectedCity = cities.firstWhere((element) => element.id == id).name!;
    return selectedCity;
  }

  Future getProfile() async {
    UserController userController = Get.find();
    try {
      setLoading();
      var response = await apiService
          .get("${AppUrls.shopGetProfile}?id=${userController.shopId}");

      if (response != null && response.data['status'] == 'success') {}
    } finally {
      setLoading();
    }
  }

  Future updateShop() async {
    UserController userController = Get.find();
    try {
      setLoading();
      // can upload mulitple images

      var data = dio.FormData.fromMap({
        "id": userController.shopId,
        "shop_description": shopDescController.text,
        "full_name": nameController.text,
        "mobile": mobileController.text,
        "email": emailController.text,
        "address": addressController.text,
        "address2": address2Controller.text,
        "landmark": landmarkController.text,
        "country": countryController.text,
        "state": stateController.text,
        "city": cityController.text,
        "post_office": postOfficeController.text,
        "pincode": pincodeController.text,
        "lat": "",
        "lng": "",
        "acc_no": accountNumberController.text,
        "bank_name": bankNameController.text,
        "ifsc_code": ifscCodeController.text,
        "acc_holder_no": accHolderNameController.text,
        "upi_id": upiIdController.text,
        "mobile2": mobile2Controller.text,
        "mobile3": mobile3Controller.text,
        "dish1": dish1NameController.text,
        "detail1": dish1DetailsController.text,
        "dish2": dish2NameController.text,
        "detail2": dish2DetailsController.text,
        "dish3": dish3NameController.text,
        "detail3": dish3DetailsController.text,
      });


      for (var image in uploadImages) {
        data.files.add(MapEntry(
            "upload",
            await dio.MultipartFile.fromFile(image.path,
                filename: image.name)));
      }

      var response = await apiService.post(AppUrls.updateShop, data);

      if (response != null && response.data['status'] == 'success') {
        Get.back();
      }
    } finally {
      setLoading();
    }
  }

  Future getStateList() async {
    try {
      setLoading();
      var res = await apiService.get(AppUrls.stateList);
      if (res != null && res.data['result'].isNotEmpty) {
        StateListResponse stateListResponse =
            StateListResponse.fromJson(res.data);
        states.value = stateListResponse.result!;

        var shop = userController.shop!;
        if (shop.state?.isNotEmpty == true) {
          cities.value =
              states.firstWhere((element) => element.id == shop.state).city!;
        }
      }
    } finally {
      setLoading();
      update();
    }
  }

  Future getCityList() async {
    cities.value = states
        .firstWhere((element) => element.name == stateController.text)
        .city!;
    update();
  }

  Future getZipList() async {
    try {
      setLoading();
      var cityId = cities.firstWhere((city) {
        return city.name == cityController.text;
      }).id;
      var res = await apiService.get("${AppUrls.zipList}?city=$cityId");
      if (res != null && res.data['result'].isNotEmpty) {
        ZipListResponse zipListResponse = ZipListResponse.fromJson(res.data);
        zips.value = zipListResponse.zipList!;
      }
    } finally {
      setLoading();
      update();
    }
  }
}
