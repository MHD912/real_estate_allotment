import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class LotDetailsWidget extends StatelessWidget {
  const LotDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _widgetContent();
  }

  Widget _widgetContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _lotId(),
        SizedBox(width: 10),
        _lotIdLabel(),
        SizedBox(
          width: AppLayout.height(40),
        ),
        _propertyId(),
        SizedBox(width: 10),
        _propertyIdLabel(),
        SizedBox(
          width: AppLayout.height(40),
        ),
        _city(),
        SizedBox(width: 10),
        _cityLabel(),
      ],
    );
  }

  Widget _propertyId() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "129",
        style: Get.theme.textTheme.bodyLarge,
      ),
    );
  }

  Widget _propertyIdLabel() {
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

  Widget _lotId() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "15",
        style: Get.theme.textTheme.bodyLarge,
      ),
    );
  }

  Widget _lotIdLabel() {
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
