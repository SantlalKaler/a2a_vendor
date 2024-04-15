import 'package:flutter/material.dart';

class TitleDividerSmall extends StatelessWidget {
  const TitleDividerSmall({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: Colors.grey.shade500,
        )),
        const SizedBox(
          width: 12,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Divider(
          color: Colors.grey.shade500,
        )),
      ],
    );
  }
}
