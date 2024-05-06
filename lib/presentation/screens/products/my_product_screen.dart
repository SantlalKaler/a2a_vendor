import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:t2p_vendor/domain/model/ProductListResponse.dart';
import 'package:t2p_vendor/presentation/constants/dimens_constants.dart';
import 'package:t2p_vendor/presentation/controller/product_controller.dart';
import 'package:t2p_vendor/presentation/widgets/app_container.dart';
import 'package:t2p_vendor/presentation/widgets/circular_loadings.dart';

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
        Get.to(() => const AddEditProductScreen());
      }),
      body: GetBuilder(
        init: ProductController(),
        builder: (controller) {
          return controller.isLoading.isTrue
              ? circularloadingRedSmallInfinitySize()
              : controller.products.isEmpty
                  ? const NoDataFound()
                  : ListView.builder(
                      padding: EdgeInsets.all(DimensConstants.screePadding),
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
                              SingleOrderInfoItem(
                                  title: "Name : ${product.name}",
                                  height: 5,
                                  width: 5,
                                  color: Colors.red),
                              Gap(DimensConstants.spaceBetweenViews),
                              SingleOrderInfoItem(
                                  title: "Weight : ${product.weight}Kg",
                                  height: 5,
                                  width: 5,
                                  color: Colors.red),
                              Gap(DimensConstants.spaceBetweenViews),
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
                                                const Text("InActive"),
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
                                                const Text("Active"),
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
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
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
