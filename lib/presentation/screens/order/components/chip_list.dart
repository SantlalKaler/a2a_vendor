import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/model/single_filter_item.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/dimens_constants.dart';
import '../../../controller/order_controller.dart';

class ChipList extends StatefulWidget {
  const ChipList({super.key});

  @override
  State<ChipList> createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrderController(),
        builder: (controller) {
          return Container(
            width: double.infinity,
            color: ColorConstants.screenBackgroundColor,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = controller.chipList[index];
                  return Chip(
                      backgroundColor: Colors.white,
                      //  elevation: 1,
                      deleteIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                      ),
                      onDeleted: () {
                        switch (item.id) {
                          case FilterItemId.startDate:
                          // TODO: Handle this case.
                          case FilterItemId.endDate:
                          // TODO: Handle this case.
                        }
                      },
                      //avatar: Icon(item.icon),
                      label: Text(item.title));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: DimensConstants.spaceBetweenViewsAndSubViews,
                  );
                },
                itemCount: controller.chipList.length),
          );
        });
  }
}
