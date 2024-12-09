import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/lot_details_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class LotDetailsWidget extends StatelessWidget {
  final _controller = Get.find<LotDetailsController>();

  LotDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _widgetContent(context);
  }

  Widget _widgetContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _remainingShare(context),
        SizedBox(width: 10),
        _remainingShareLabel(context),
        SizedBox(
          width: AppLayout.height(40),
        ),
        _lotNumber(context),
        SizedBox(width: 10),
        _lotNumberLabel(context),
        SizedBox(
          width: AppLayout.height(40),
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
    return GetBuilder<LotDetailsController>(
      builder: (controller) {
        final formattedValue = intl.NumberFormat('#.###').format(
          controller.remainingShare.abs(),
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

  Widget _propertyNumber(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        _controller.propertyNumber,
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
        _controller.city,
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

  Widget _lotNumber(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        _controller.lotNumber,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }

  Widget _lotNumberLabel(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "رقم المقسم:",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
