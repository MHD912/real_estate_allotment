import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/views/allotments/widgets/allotment_item_widget.dart';

class PropertyAllotmentItemWidget extends AllotmentItemWidget {
  PropertyAllotmentItemWidget({
    super.key,
    required super.index,
    required super.allotment,
  }) : super(
          allotedObject: Get.find<ChoosePropertyController>().property!,
        );

  @override
  void onPressedEditButton() {
    Get.toNamed(
      AppRoutes.editPropertyAllotment,
      arguments: {
        'allotment': allotment,
      },
    );
  }

  @override
  Widget infoBox(BuildContext context) {
    return Container(
      height: AppLayout.height(60),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _shareWidget(context),
          _ownerNameWidget(context),
        ],
      ),
    );
  }

  Widget _ownerNameWidget(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerRight,
      child: Text(
        allotment.shareholderName,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _shareWidget(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          alignment: Alignment.centerRight,
          child: Text(
            "${allotment.share}",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
        FittedBox(
          alignment: Alignment.centerRight,
          child: Text(
            "الحصة: ",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    );
  }
}
