import 'package:flutter/material.dart';

class FilterItem {
  String title;
  FilterItemId id;
  IconData? icon;

  FilterItem({required this.title, required this.id, this.icon});
}

enum FilterItemId {
  startDate,
  endDate
}


