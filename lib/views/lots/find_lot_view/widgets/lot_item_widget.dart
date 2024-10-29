import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/lots/find_lot_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_assets.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/custom_icon_button.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

class LotItemWidget extends StatelessWidget {
  final _controller = Get.find<FindLotController>();
  final Lot lot;
  final int index;
  LotItemWidget({
    super.key,
    required this.index,
    required this.lot,
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
            child: _lotInfoBox(),
          ),
          Expanded(
            child: _rowNumber(),
          ),
        ],
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return CustomIconButton(
      onPressed: () async {
        final success = await _controller.deleteLot(
          lotId: lot.id,
        );
        if (!context.mounted) return;
        if (success) {
          AppToast.show(
            context: context,
            type: AppToastType.success,
            description: "تم حذف العقار بنجاح.",
          );
          final findLotController = Get.find<FindLotController>();
          await findLotController.getLots(
            propertyId: lot.propertyId,
          );
          findLotController.update();
        } else {
          AppToast.show(
            context: context,
            type: AppToastType.error,
            description: "لم نتمكن من حذف هذا العقار.",
          );
        }
      },
      iconSize: 40,
      iconPath: AppAssets.icons.deleteIcon,
      toolTip: "حذف",
    );
  }

  Widget _editButton() {
    return CustomIconButton(
      onPressed: () => Get.toNamed(
        AppRoutes.editLot,
        arguments: {
          'lot_id': lot.id,
        },
      ),
      iconSize: 30,
      iconPath: AppAssets.icons.editIcon,
      toolTip: "تعديل",
    );
  }

  Widget _lotInfoBox() {
    return Container(
      height: AppLayout.height(60),
      padding: EdgeInsets.symmetric(vertical: 5),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                _remainingShare(),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: _remainingShareLabel(),
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                _lotNumber(),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: _lotNumberLabel(),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _lotNumber() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      alignment: Alignment.centerRight,
      child: Text(
        lot.lotNumber,
        style: Get.theme.textTheme.titleMedium,
      ),
    );
  }

  Widget _lotNumberLabel() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "المقسم رقم:",
        style: Get.theme.textTheme.titleMedium?.copyWith(
          color: Get.theme.colorScheme.primary,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _remainingShare() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      alignment: Alignment.centerRight,
      child: Text(
        "${lot.remainingShare}",
        style: Get.theme.textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _remainingShareLabel() {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        "الأسهم المتبقية:",
        style: Get.theme.textTheme.titleMedium?.copyWith(
          color: Get.theme.colorScheme.primary,
        ),
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.rtl,
      ),
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
