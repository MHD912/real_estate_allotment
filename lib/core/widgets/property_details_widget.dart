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
    return _widgetContent(context);
  }

  Widget _widgetContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: (isAllotment)
              ? [
                  _remainingShare(context),
                  SizedBox(width: 10),
                  _remainingShareLabel(context),
                  SizedBox(
                    width: AppLayout.height(40),
                  ),
                ]
              : [
                  _remainingValue(context),
                  SizedBox(width: 10),
                  _remainingValueLabel(context),
                  SizedBox(
                    width: AppLayout.height(40),
                  ),
                ],
        ),
        _propertyNumber(context),
        SizedBox(width: 10),
        _propertyNumberLabel(context),
        SizedBox(
          width: AppLayout.height(40),
        ),
        _city(context),
        SizedBox(width: 10),
        _cityLabel(context),
      ],
    );
  }

  Widget _remainingShare(BuildContext context) {
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
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        );
      },
    );
  }

  Widget _remainingShareLabel(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "الحصة المتبقية:",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _remainingValue(BuildContext context) {
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
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        );
      },
    );
  }

  Widget _remainingValueLabel(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "القيمة المتبقية:",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _propertyNumber(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        _controller.property.propertyNumber,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }

  Widget _propertyNumberLabel(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "رقم العقار:",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _city(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        _controller.property.city,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _cityLabel(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "المنطقة:",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
