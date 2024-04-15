import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/model/single_filter_item.dart';

class OrderController extends GetxController{
  var chipList = [
    FilterItem(title: "Start Date", id: FilterItemId.startDate),
    FilterItem(title: "End Date", id: FilterItemId.endDate),
  ];
}