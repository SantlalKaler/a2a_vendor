import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:a2a_vendor/presentation/constants/dimens_constants.dart';

import '../constants/image_constants.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImageConstants.noDataFound),
        Gap(DimensConstants.spaceBetweenViews),
        Text(
          "Sorry, No data found",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
