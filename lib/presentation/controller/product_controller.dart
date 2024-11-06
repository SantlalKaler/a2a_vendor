import 'package:a2a_vendor/presentation/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:a2a_vendor/data/status.dart';
import 'package:a2a_vendor/domain/model/CatSubCatResponse.dart';
import 'package:a2a_vendor/presentation/controller/user_controller.dart';
import 'package:a2a_vendor/presentation/widgets/custom_snackbar.dart';

import '../../data/api_services.dart';
import '../../data/app_urls.dart';
import '../../domain/model/ProductListResponse.dart';
import '../../domain/model/upload_image.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool buttonLoading = false.obs;

  Product? selectedProduct;

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
  TextEditingController sellingPrice = TextEditingController();
  TextEditingController discountedPrice = TextEditingController();
  TextEditingController sku = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController productSubCategory = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  RxList<UploadImage> uploadImages = RxList<UploadImage>();

  addUploadImageData(UploadImage image) {
    uploadImages.add(image);
    update();
  }

  removeUploadImageData(int index) {
    uploadImages.removeAt(index);
    update();
  }

  Future getProducts() async {
    try {
      setLoading();
      var data = {"shop": userController.shopId};
      var response = await apiService.post(AppUrls.shopProductList, data);

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
      setLoading();
      var data = dio.FormData.fromMap({
        "name": productName.text,
        "weight": productWeight.text,
        "category": getCategoryId(),
        "sub_category": getSubCategoryId(),
        "description": productDescription.text,
        "shop": userController.shop!.id,
        "selling_price": sellingPrice.text,
        "discounted_price": discountedPrice.text,
        "sku": sku.text,
        "length": length.text,
        "width": width.text,
        "height": height.text,
      });

      // for (var image in uploadImages) {
      if(uploadImages.isNotEmpty){
        if (kIsWeb) {
          data.files.add(MapEntry(
              "upload",
              dio.MultipartFile.fromBytes(uploadImages[0].byteImage!,
                  filename: uploadImages[0].name)));
        } else {
          data.files.add(MapEntry(
              "upload",
              await dio.MultipartFile.fromFile(uploadImages[0].path,
                  filename: uploadImages[0].name)));
        }
      }


      var response = await apiService.post(AppUrls.addProduct, data);

      CustomSnackBar.showSnackBar(response?.data['message']);

      if (response != null && response.data['status'] == 'success') {
        getProducts();
        clearData();
      }
    } finally {
      setLoading();
      update();
    }
  }

  Future updateProduct() async {
    try {
      setLoading();
      var data = dio.FormData.fromMap({
        "name": productName.text,
        "weight": productWeight.text,
        "category": getCategoryId(),
        "sub_category": getSubCategoryId(),
        "description": productDescription.text,
        "id": selectedProduct!.id,
        "selling_price": sellingPrice.text,
        "discounted_price": discountedPrice.text,
        "sku": sku.text,
        "length": length.text,
        "width": width.text,
        "height": height.text,
      });

      if(uploadImages.isNotEmpty){
        if (kIsWeb) {
          data.files.add(MapEntry(
              "upload",
              dio.MultipartFile.fromBytes(uploadImages[0].byteImage!,
                  filename: uploadImages[0].name)));
        } else {
          data.files.add(MapEntry(
              "upload",
              await dio.MultipartFile.fromFile(uploadImages[0].path,
                  filename: uploadImages[0].name)));
        }
      }

      var response = await apiService.post(AppUrls.updateProduct, data);

      CustomSnackBar.showSnackBar(response?.data['message']);

      if (response != null && response.data['status'] == 'success') {
        Get.back();
        getProducts();
        clearData();
      }
    } finally {
      setLoading();
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
        if (selectedProduct != null) {
          setData();
        }
      }
    } finally {
      setLoading();
      update();
    }
  }

  Future getSubCategories(String categoryName) async {
    for (var item in categories) {
      if (item.name == categoryName) {
        try {
          setLoading();
          var res = await apiService.post(AppUrls.subCategory, {
            "id": item.id,
          });

          if (res != null &&
              res.data['status'] == Status.success.name &&
              res.data['result'].isNotEmpty) {
            CatSubCatResponse catResponse =
                CatSubCatResponse.fromJson(res.data);
            subCategories.value = catResponse.catSubCats!;
          }
        } finally {
          setLoading();
          update();
        }
      }
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
    sellingPrice.clear();
    discountedPrice.clear();
    sku.clear();
    length.clear();
    width.clear();
    height.clear();
    uploadImages.clear();
    selectedProduct = null;
  }

  setData() {
    productName.text = selectedProduct!.name ?? "";
    productWeight.text = selectedProduct!.weight ?? "";
    productCategory.text = selectedProduct!.category?.name ?? "";
    productSubCategory.text = selectedProduct!.subCategory?.name ?? "";
    productDescription.text = selectedProduct!.description ?? "";
    sellingPrice.text = selectedProduct!.sellingPrice ?? "";
    discountedPrice.text = selectedProduct!.discountedPrice ?? "";
    sku.text = selectedProduct!.sku ?? "";
    length.text = selectedProduct!.length ?? "";
    width.text = selectedProduct!.width ?? "";
    height.text = selectedProduct!.height ?? "";
  }
}
