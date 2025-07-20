import 'package:a2a_vendor/presentation/constants/string_constants.dart';
import 'package:a2a_vendor/presentation/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:a2a_vendor/domain/model/ProductListResponse.dart';
import 'package:a2a_vendor/presentation/constants/dimens_constants.dart';
import 'package:a2a_vendor/presentation/controller/product_controller.dart';
import 'package:a2a_vendor/presentation/widgets/app_container.dart';
import 'package:a2a_vendor/presentation/widgets/circular_loadings.dart';
import 'package:go_router/go_router.dart';

import '../../../responsive.dart';
import '../../widgets/app_no_data_found.dart';
import '../order/components/single_order_info_item.dart';
import 'add_edit_product_screen.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({super.key});

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  ProductController productController = Get.find();

  @override
  void initState() {
    productController.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("My Products"),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle),
          onPressed: () {
            productController.clearData();
            productController.selectedProduct = null;
            context.pushNamed(RoutesConstants.addProductScreen);
          }),
      body: GetBuilder(
        init: ProductController(),
        builder: (controller) {
          return controller.isLoading.isTrue
              ? circularloadingRedSmallInfinitySize()
              : controller.products.isEmpty
                  ? const NoDataFound()
                  : ListView.builder(
                      padding: Responsive.isMobile(context)
                          ? EdgeInsets.all(DimensConstants.screePadding)
                          : EdgeInsets.symmetric(
                              horizontal: DimensConstants.desktopScreePadding,
                              vertical: DimensConstants.screePadding),
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        Product product = controller.products[index];
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: DimensConstants.spaceBetweenViews),
                          child: AppContainer(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product.image != null &&
                                  product.image!.isNotEmpty)
                                Row(
                                  children: [
                                    for(var image in product.image!)
                                      Image.network(
                                        image,
                                        height: 100,
                                        width: 100,
                                      ),
                                  ],
                                ),
                              Gap(DimensConstants.spaceBetweenViews),
                              SingleOrderInfoItem(
                                  title: "Name : ${product.name}",
                                  height: 5,
                                  width: 5,
                                  color: Colors.red),
                              Gap(DimensConstants.spaceBetweenViews),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SingleOrderInfoItem(
                                      title: "Weight : ${product.weight}Kg",
                                      height: 5,
                                      width: 5,
                                      color: Colors.red),
                                  SingleOrderInfoItem(
                                      title: "Selling Price : ${StringConstants.rupeeSign} ${product.sellingPrice}",
                                      height: 5,
                                      width: 5,
                                      color: Colors.red),
                                ],
                              ),
                              Gap(DimensConstants.spaceBetweenViews),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SingleOrderInfoItem(
                                      title: "Discounted Price : ${StringConstants.rupeeSign} ${product.discountedPrice}",
                                      height: 5,
                                      width: 5,
                                      color: Colors.red),
                                  SingleOrderInfoItem(
                                      title: "SKU : ${product.sku}",
                                      height: 5,
                                      width: 5,
                                      color: Colors.red),
                                ],
                              ),   Gap(DimensConstants.spaceBetweenViews),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SingleOrderInfoItem(
                                      title: "Length : ${product.length}",
                                      height: 5,
                                      width: 5,
                                      color: Colors.red),
                                  SingleOrderInfoItem(
                                      title: "Height : ${product.height}",
                                      height: 5,
                                      width: 5,
                                      color: Colors.red),
                                ],
                              ),
                              Gap(DimensConstants.spaceBetweenViews),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SingleOrderInfoItem(
                                      title: "Width : ${product.width}",
                                      height: 5,
                                      width: 5,
                                      color: Colors.red),

                                ],
                              ),
                              Gap(DimensConstants.highSpacing),
                              Text(
                                "${product.description}",
                              ),
                              Gap(DimensConstants.spaceBetweenViews),
                              const Divider(),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: controller.buttonLoading.isTrue
                                        ? circularloadingRedSmall()
                                        : Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: DimensConstants
                                                    .spaceBetweenViewsAndSubViews),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Switch(
                                                    value: product.active == 0
                                                        ? false
                                                        : true,
                                                    onChanged: (value) {
                                                      controller
                                                          .updateProductStatus(
                                                              product.id!,
                                                              value ? 1 : 0);
                                                    }),
                                              ],
                                            ),
                                          ),
                                  ),
                                  Gap(DimensConstants.spaceBetweenViews),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: DimensConstants
                                              .spaceBetweenViewsAndSubViews),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 0.5, color: Colors.grey)),
                                      child: IconButton(
                                        onPressed: () {
                                          controller.clearData();
                                          controller.selectedProduct = product;
                                          context.pushNamed(
                                              RoutesConstants.addProductScreen);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(DimensConstants.spaceBetweenViews),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: DimensConstants
                                              .spaceBetweenViewsAndSubViews),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 0.5, color: Colors.grey)),
                                      child: IconButton(
                                        onPressed: () {

                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                        );
                      },
                    );

        },
      ),
    );
  }
}
