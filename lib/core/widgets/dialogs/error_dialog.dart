import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Get.theme.colorScheme.surfaceContainer,
      title: Center(
        child: Text(
          "Error Occurred!",
          style: Get.textTheme.headlineLarge,
        ),
      ),
    );
  }
}
