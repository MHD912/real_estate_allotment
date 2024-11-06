import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';
import 'package:toastification/toastification.dart';

enum AppToastType { success, error }

class AppToast extends ToastificationItem {
  AppToast({
    required super.builder,
    required super.alignment,
  });

  static ToastificationItem show({
    required BuildContext context,
    required AppToastType type,
    String? title,
    required String description,
  }) {
    return toastification.show(
      context: context,
      type: (type == AppToastType.success)
          ? ToastificationType.success
          : ToastificationType.error,
      style: ToastificationStyle.fillColored,
      primaryColor: (type == AppToastType.success)
          ? AppTheme.greenColor
          : AppTheme.redColor,
      backgroundColor: (type == AppToastType.success)
          ? AppTheme.greenColor
          : AppTheme.redColor,
      margin: const EdgeInsets.only(top: 50, right: 25),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      title: Text(
        (title != null)
            ? title
            : (type == AppToastType.success)
                ? "تمت العملية!"
                : "حدث خطأ!",
        style: Get.textTheme.titleMedium,
      ),
      description: Text(
        description,
        style: Get.textTheme.bodyMedium,
      ),
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 500),
      autoCloseDuration: const Duration(seconds: 4),
      direction: TextDirection.rtl,
      closeButtonShowType: CloseButtonShowType.always,
      showProgressBar: true,
      pauseOnHover: true,
    );
  }
}
