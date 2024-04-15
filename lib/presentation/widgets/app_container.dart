import 'package:flutter/material.dart';

import '../constants/dimens_constants.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final double width;

  const AppContainer(
      {super.key,
      required this.child,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(DimensConstants.cardInnerPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: child,
    );
  }
}
