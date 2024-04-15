import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t2p_vendor/presentation/controller/order_controller.dart';

import '../../constants/color_constant.dart';
import '../../constants/dimens_constants.dart';
import 'components/chip_list.dart';
import 'components/single_order_item.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrderController(),
        builder: (controller) {
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    title: const Text("My Orders"),
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    bottom: PreferredSize(
                      preferredSize: const Size(double.infinity, 50),
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            color: ColorConstants.screenBackgroundColor,
                            child: const ChipList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: DimensConstants.screePadding,
                        vertical: DimensConstants.spaceBetweenViewsAndSubViews),
                     child: const SingleOrderItem(),
                  );
                },
              ),
            ),
          );
        });
  }
}
