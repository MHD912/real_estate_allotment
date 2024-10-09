import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final widgetWidth = AppLayout.width(280);
    final widgetHeight = widgetWidth * (3 / 4);
    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            label,
            style: Get.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
