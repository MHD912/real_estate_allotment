import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _widgetContent();
  }

  Widget _widgetContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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

  Widget _propertyNumber() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "129",
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
        "ماروتا سيتي",
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
}
