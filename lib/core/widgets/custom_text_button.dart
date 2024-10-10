import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final void Function() onPressed;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppLayout.width(200),
      height: AppLayout.height(70),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
        ),
        child: FittedBox(
          child: Text(
            label,
            style: Get.theme.textTheme.labelLarge?.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
