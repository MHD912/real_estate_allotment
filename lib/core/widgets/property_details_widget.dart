import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:real_estate_allotment/controllers/properties/property_details_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class PropertyDetailsWidget extends StatelessWidget {
  final _controller = Get.find<PropertyDetailsController>();
  final bool isAllotment;

  PropertyDetailsWidget({super.key, required this.isAllotment});

  @override
  Widget build(BuildContext context) {
    return _widgetContent();
  }

  Widget _widgetContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: (isAllotment)
              ? [
                  _remainingShare(),
                  SizedBox(width: 10),
                  _remainingShareLabel(),
                  SizedBox(
                    width: AppLayout.height(40),
                  ),
                ]
              : [
                  _remainingValue(),
                  SizedBox(width: 10),
                  _remainingValueLabel(),
                  SizedBox(
                    width: AppLayout.height(40),
                  ),
                ],
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
    return GetBuilder<PropertyDetailsController>(
      id: 'share',
      builder: (controller) {
        final formattedValue = intl.NumberFormat('#.###').format(
          controller.property.remainingShare,
        );
        return FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            formattedValue,
            style: Get.theme.textTheme.bodyLarge,
          ),
        );
      },
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

  Widget _remainingValue() {
    return GetBuilder<PropertyDetailsController>(
      id: 'value',
      builder: (controller) {
        final formattedValue = intl.NumberFormat("#,###").format(
          controller.property.remainingValue.round(),
        );
        return FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            formattedValue,
            style: Get.theme.textTheme.bodyLarge,
          ),
        );
      },
    );
  }

  Widget _remainingValueLabel() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "القيمة المتبقية:",
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
        _controller.property.propertyNumber,
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
        _controller.property.city,
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
