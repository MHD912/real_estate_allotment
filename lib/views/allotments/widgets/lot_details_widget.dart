import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/lot_details_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class LotDetailsWidget extends StatelessWidget {
  final _controller = Get.find<LotDetailsController>();

  LotDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _widgetContent();
  }

  Widget _widgetContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _remainingShare(),
        SizedBox(width: 10),
        _remainingShareLabel(),
        SizedBox(
          width: AppLayout.height(40),
        ),
        _lotNumber(),
        SizedBox(width: 10),
        _lotNumberLabel(),
        SizedBox(
          width: AppLayout.height(40),
        ),
        _propertyNumber(),
        SizedBox(width: 10),
        _propertyNumberLabel(),
        SizedBox(
          width: AppLayout.height(40),
        ),
        _city(),
        SizedBox(width: 10),
        _cityLabel(),
      ],
    );
  }

  Widget _remainingShare() {
    return GetBuilder<LotDetailsController>(
      builder: (controller) => FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          controller.remainingShare.toString(),
          style: Get.theme.textTheme.bodyLarge,
        ),
      ),
    );
  }

  Widget _remainingShareLabel() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "الحصة المتبقية:",
        style: Get.theme.textTheme.bodyLarge?.copyWith(
          color: Get.theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _propertyNumber() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        _controller.propertyNumber,
        style: Get.theme.textTheme.bodyLarge,
      ),
    );
  }

  Widget _propertyNumberLabel() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "رقم العقار:",
        style: Get.theme.textTheme.bodyLarge?.copyWith(
          color: Get.theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _city() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        _controller.city,
        style: Get.theme.textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _cityLabel() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "المنطقة:",
        style: Get.theme.textTheme.bodyLarge?.copyWith(
          color: Get.theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _lotNumber() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        _controller.lotNumber,
        style: Get.theme.textTheme.bodyLarge,
      ),
    );
  }

  Widget _lotNumberLabel() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "رقم المقسم:",
        style: Get.theme.textTheme.bodyLarge?.copyWith(
          color: Get.theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
