import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/choose_allotment_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/views/allotments/lot_allotment/edit_lot_allotment_view/edit_lot_allotment_view.dart';
import 'package:real_estate_allotment/views/allotments/widgets/allotment_item_widget.dart';

class ShareholderAllotmentItemWidget extends AllotmentItemWidget {
  final Lot lot;
  ShareholderAllotmentItemWidget({
    super.key,
    required super.index,
    required super.allotment,
    required this.lot,
  }) : super(allotedObject: Object());

  @override
  void onPressedEditButton() {
    Get.find<ChooseAllotmentController>().lot = lot;
    Get.toNamed(
      AppRoutes.editLotAllotment,
      arguments: {
        'allotment': allotment,
        'view_mode': ViewMode.chooseAllotment,
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
          _lotNumberWidget(context),
        ],
      ),
    );
  }

  Widget _lotNumberWidget(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          alignment: Alignment.centerRight,
          child: Text(
            lot.lotNumber,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
        FittedBox(
          alignment: Alignment.centerRight,
          child: Text(
            "المقسم: ",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
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
