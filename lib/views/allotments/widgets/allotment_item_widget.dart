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
  AllotmentItemWidget({
    super.key,
    required this.index,
    required this.allotment,
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
            child: _propertyInfoBox(),
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
          allotmentId: allotment.id,
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
                ? (allotment as RealEstateAllotment).propertyId
                : (allotment as LotAllotment).lotId,
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

  Widget _propertyInfoBox() {
    return Container(
      height: AppLayout.height(60),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Get.theme.colorScheme.outline,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _shareValueWidget(),
          _ownerNameWidget(),
        ],
      ),
    );
  }

  Widget _ownerNameWidget() {
    return FittedBox(
      alignment: Alignment.centerRight,
      child: Text(
        allotment.shareholderName,
        style: Get.theme.textTheme.titleMedium,
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _shareValueWidget() {
    return Row(
      children: [
        FittedBox(
          alignment: Alignment.centerRight,
          child: Text(
            "${allotment.share}",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
        FittedBox(
          alignment: Alignment.centerRight,
          child: Text(
            "الحصة: ",
            style: Get.theme.textTheme.titleMedium?.copyWith(
              color: Get.theme.colorScheme.primary,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    );
  }

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
