import 'package:a2a_vendor/responsive.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key, required this.child, this.onPressed});

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Container(
            constraints: BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: Responsive.isDesktop(context) ? 50 : 45,
            ),
            alignment: Alignment.center,
            child: child));
  }
}
