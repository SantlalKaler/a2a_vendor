import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t2p_vendor/data/status.dart';
import 'package:t2p_vendor/domain/model/CatSubCatResponse.dart';
import 'package:t2p_vendor/presentation/controller/user_controller.dart';
import 'package:t2p_vendor/presentation/widgets/custom_snackbar.dart';

import '../../data/api_services.dart';
import '../../data/app_urls.dart';
import '../../domain/model/ProductListResponse.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool buttonLoading = false.obs;

  setLoading() => isLoading.value = !isLoading.value;

  setButtonLoading() => isLoading.value = !isLoading.value;

  RxList<Product> products = RxList<Product>();
  RxList<CatSubCat> categories = RxList<CatSubCat>();
  RxList<CatSubCat> subCategories = RxList<CatSubCat>();

  ApiService apiService = ApiService();
  UserController userController = Get.find();

  TextEditingController productName = TextEditingController();
  TextEditingController productWeight = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController productSubCategory = TextEditingController();
  TextEditingController productDescription = TextEditingController();

  Future getProducts() async {
    try {
      setLoading();
      var data = {"shop": userController.shopId};
      var response = await apiService.post(AppUrls.shopProductList, {},
          hasQueryParam: true, queryParam: data);

      if (response != null &&
          response.data['status'] == 'success' &&
          response.data['result'].isNotEmpty) {
        ProductListResponse productListResponse =
            ProductListResponse.fromJson(response.data);
        products.value = productListResponse.products!;
      }
    } finally {
      setLoading();
      update();
    }
  }

  Future updateProductStatus(String productId, num status) async {
    try {
      setButtonLoading();
      var data = {"id": productId, "active": status};

      var response = await apiService.post(AppUrls.updateProductStatus, data);

      CustomSnackBar.showSnackBar(response?.data['message']);

      if (response != null && response.data['status'] == 'success') {
        getProducts();
      }
    } finally {
      setButtonLoading();
      update();
    }
  }

  Future addProduct() async {
    try {
      setButtonLoading();
      var data = {
        "name": productName.text,
        "weight": productWeight.text,
        "category": getCategoryId(),
        "sub_category": getSubCategoryId(),
        "description": productDescription.text,
        "shop": userController.shop!.id
      };

      var response = await apiService.post(AppUrls.addProduct, data);

      CustomSnackBar.showSnackBar(response?.data['message']);

      if (response != null && response.data['status'] == 'success') {
        getProducts();
        clearData();
      }
    } finally {
      setButtonLoading();
      update();
    }
  }

  Future updateProduct(String productId) async {
    try {
      setButtonLoading();
      var data = {
        "name": productName.text,
        "weight": productWeight.text,
        "category": getCategoryId(),
        "sub_category": getSubCategoryId(),
        "description": productDescription.text,
        "id": productId
      };

      var response = await apiService.post(AppUrls.addProduct, data);

      CustomSnackBar.showSnackBar(response?.data['message']);

      if (response != null && response.data['status'] == 'success') {
        getProducts();
      }
    } finally {
      setButtonLoading();
      update();
    }
  }

  Future getCategories() async {
    try {
      setLoading();
      var res = await apiService.post(AppUrls.category, {});

      if (res != null &&
          res.data['status'] == Status.success.name &&
          res.data['result'].isNotEmpty) {
        CatSubCatResponse catResponse = CatSubCatResponse.fromJson(res.data);
        categories.value = catResponse.catSubCats!;
        getSubCategories();
      }
    } finally {
      setLoading();
      update();
    }
  }

  Future getSubCategories() async {
    try {
      setLoading();
      var res = await apiService.post(AppUrls.subCategory, {});

      if (res != null &&
          res.data['status'] == Status.success.name &&
          res.data['result'].isNotEmpty) {
        CatSubCatResponse catResponse = CatSubCatResponse.fromJson(res.data);
        subCategories.value = catResponse.catSubCats!;
      }
    } finally {
      setLoading();
      update();
    }
  }

  getCategoryId() {
    return categories
        .firstWhere((element) => element.name == productCategory.text)
        .id;
  }

  getSubCategoryId() {
    return subCategories
        .firstWhere((element) => element.name == productSubCategory.text)
        .id;
  }

  clearData() {
    productName.clear();
    productWeight.clear();
    productCategory.clear();
    productSubCategory.clear();
    productDescription.clear();
  }

  setData() {
    productName.clear();
    productWeight.clear();
    productCategory.clear();
    productSubCategory.clear();
    productDescription.clear();
  }
}
