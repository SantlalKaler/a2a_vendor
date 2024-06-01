import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:a2a_vendor/presentation/screens/order/components/single_order_info_item.dart';

import '../../../constants/dimens_constants.dart';
import '../../../widgets/app_container.dart';

class SingleOrderItem extends StatelessWidget {
  //final CommonOrder order;

  const SingleOrderItem({
    super.key,
    /* required this.order*/
  });

  @override
  Widget build(BuildContext context) {
    /*OrderController controller = Get.find();
    UserController userController = Get.find();*/
    return AppContainer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.red),
              child: Text(
                "Payment Mode",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Text(
              "Order No : ",
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
        Gap(DimensConstants.spaceBetweenViews),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleOrderInfoItem(
                  title: "Pickup City",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: verticalDivider(),
                ),
                SingleOrderInfoItem(
                  title: "Delivery City",
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Rs. "),
                Gap(DimensConstants.spaceBetweenViews),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade50),
                  child: Text(
                    "Pickup Boy",
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              ],
            )
          ],
        ),
        Gap(DimensConstants.highSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleOrderInfoItem(
                title: "Pickup Weight :  KG",
                height: 5,
                width: 5,
                color: Colors.red),
          ],
        ),
        Gap(DimensConstants.spaceBetweenViews),
        SingleOrderInfoItem(
            title: "Delivery Weight : KG",
            height: 5,
            width: 5,
            color: Colors.red),
        Gap(DimensConstants.spaceBetweenViews),
        const SingleOrderInfoItem(
            title: "Product : ", height: 5, width: 5, color: Colors.red),
        Text("Product Name"),
        Gap(DimensConstants.spaceBetweenViews),
        SingleOrderInfoItem(
            title: "Express : ", height: 5, width: 5, color: Colors.red),
        Gap(DimensConstants.spaceBetweenViews),
        InkWell(
          onTap: () async {
            //launchDialer(order.customerNumber!);
          },
          child: SingleOrderInfoItem(
              title: "Customer Mobile : ",
              height: 5,
              width: 5,
              color: Colors.red),
        ),
        Gap(DimensConstants.spaceBetweenViews),
        const SingleOrderInfoItem(
            title: "Customer Address : ",
            height: 5,
            width: 5,
            color: Colors.red),
        Text(
          "Customer Address",
          maxLines: 20,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        /*Gap(DimensConstants.spaceBetweenViews),
        singleAddressItem(
            title: "Payment Mode : ", height: 5, width: 5, color: Colors.red),*/
        Gap(DimensConstants.spaceBetweenViews),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleOrderInfoItem(
                title: "Delivery Date : ",
                height: 5,
                width: 5,
                color: Colors.red),
          ],
        ),
        Gap(DimensConstants.spaceBetweenViews),
        SingleOrderInfoItem(
            title: "Delivery Time : ",
            height: 5,
            width: 5,
            color: Colors.red),
        Gap(DimensConstants.spaceBetweenViews),
        SingleOrderInfoItem(
            title: "Status : ",
            height: 5,
            width: 5,
            color: Colors.red),
        //Gap(DimensConstants.spaceBetweenViews),
        /*Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                tileColor: Theme.of(context).primaryColor,
                checkColor: Colors.green,
                value: controller.orderSelected(order.id!),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectOrder(order.id!);
                  }
                },
                title: const Text(
                  "Select Order",
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),

            *//** who can update t2p order weight
                1. partner, of pickup orders
                2. boy, of delivery orders
                <----------------------------->
                who can update af2ap order weight, height, width, length
                1. only pickup boy **//*

            if (userController.userType == UserType.delivery_boy.name &&
                controller.orderType == OrderType.pickup)
              Expanded(
                  child: controller.updateButtonLoading.isTrue
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [circularloadingRedSmall()],
                        )
                      : TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return controller.t2pOrderType ==
                                        T2POrderType.T2P
                                    ? t2pWeightUpdateDialog(order.id!)
                                    : AF2APProductDialog(
                                        order: order,
                                      );
                              },
                            );
                          },
                          child: const Text("Update"))),

            // if af2ap pickup boy take payment when he pick food from user
            *//*if (userController.userType == UserType.delivery_boy.name &&
                controller.orderType == OrderType.pickup && controller.t2pOrderType == T2POrderType.AF2AP)
              Expanded(
                  child:TextButton(
                          onPressed: () {
                            takePayment(context);
                          },
                          child: const Text("Take Payment"))),*//*
          ],
        ),*/
        /* SizedBox(
          height: 30,
          child: SwipeableButtonView(
            buttonText: 'Start Order',
            buttonWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
            activeColor: const Color(0xFFB71C1C),
            isFinished: isFinished,
            onWaitingProcess: () {
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  isFinished = false;
                });
              });
            },
            onFinish: () async {
              setState(() {
                isFinished = false;
              });
            },
          ),
        )*/
      ],
    ));
  }

  verticalDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey,
    );
  }

 /* void launchDialer(String phoneNumer) async {
    String url = "tel:$phoneNumer";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }*/
}
