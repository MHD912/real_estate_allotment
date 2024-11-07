import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class LotDetailsWidget extends StatelessWidget {
  final String city, propertyNumber, lotNumber;
  const LotDetailsWidget({
    super.key,
    required this.city,
    required this.propertyNumber,
    required this.lotNumber,
  });

  @override
  Widget build(BuildContext context) {
    return _widgetContent();
  }

  Widget _widgetContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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

  Widget _propertyNumber() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        propertyNumber,
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
        city,
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
        lotNumber,
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
