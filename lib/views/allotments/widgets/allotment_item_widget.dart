import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_assets.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/custom_icon_button.dart';
import 'package:real_estate_allotment/models/allotment/allotment.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';

abstract class AllotmentItemWidget extends StatelessWidget {
  final _controller = Get.find<FindAllotmentController>();
  final int index;
  final Allotment allotment;
  final Object allotedObject;
  AllotmentItemWidget({
    super.key,
    required this.index,
    required this.allotment,
    required this.allotedObject,
  });

  @override
  Widget build(BuildContext context) {
    return _widgetContent(context);
  }

  Widget _widgetContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppLayout.height(10),
      ),
      child: Row(
        children: [
          Spacer(),
          _deleteButton(context),
          _editButton(),
          SizedBox(
            width: AppLayout.height(10),
          ),
          Expanded(
            flex: 5,
            child: infoBox(),
          ),
          _rowNumber(),
          Spacer(),
        ],
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return CustomIconButton(
      iconSize: 40,
      iconPath: AppAssets.icons.deleteIcon,
      onPressed: () async {
        final success = await _controller.deleteAllotment(
          allotment: allotment,
          allotedObject: allotedObject,
        );

        if (!context.mounted) return;
        if (success) {
          AppToast.show(
            context: context,
            type: AppToastType.success,
            description: "تم حذف العقار بنجاح.",
          );
          await _controller.getAllotments(
            allotedObjectId: (allotment is LotAllotment)
                ? (allotment as LotAllotment).lotId
                : (allotment as RealEstateAllotment).propertyId,
          );
          _controller.update();
        } else {
          AppToast.show(
            context: context,
            type: AppToastType.error,
            description: "لم نتمكن من حذف هذا العقار.",
          );
        }
      },
    );
  }

  Widget _editButton() {
    return CustomIconButton(
      iconSize: 30,
      iconPath: AppAssets.icons.editIcon,
      onPressed: onPressedEditButton,
    );
  }

  void onPressedEditButton();

  Widget infoBox();

  Widget _rowNumber() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        ".${index + 1}",
        style: Get.theme.textTheme.titleMedium,
      ),
    );
  }
}
