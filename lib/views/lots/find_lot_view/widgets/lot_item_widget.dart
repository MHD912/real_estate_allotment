import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:real_estate_allotment/controllers/lots/find_lot_controller.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
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
            child: _lotInfoBox(context),
          ),
          Expanded(
            child: _rowNumber(context),
          ),
        ],
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return CustomIconButton(
      onPressed: () async {
        final result = await _controller.deleteLot(
          lot: lot,
          property: Get.find<ChoosePropertyController>().property!,
        );
        if (!context.mounted) return;
        switch (result) {
          case DeleteResult.success:
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
            break;
          case DeleteResult.lotError:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description:
                  "لم نتمكن من حذف هذا المقسم بسبب حدوث خطأ أثناء تعديل جدول المقاسم.",
            );
            break;
          case DeleteResult.propertyError:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description:
                  "لم نتمكن من حذف هذا المقسم بسبب حدوث خطأ أثناء تعديل جدول العقارات.",
            );
            break;
          case DeleteResult.error:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "لم نتمكن من حذف هذا العقار.",
            );
            break;
          case DeleteResult.allotmentError:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description:
                  "لم نتمكن من حذف هذا المقسم بسبب حدوث خطأ أثناء تعديل جدول الاختصاصات.",
            );
            break;
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
          'lot': lot,
        },
      ),
      iconSize: 30,
      iconPath: AppAssets.icons.editIcon,
      toolTip: "تعديل",
    );
  }

  Widget _lotInfoBox(BuildContext context) {
    return Container(
      height: AppLayout.height(100),
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: _remainingShareWidget(context),
                ),
                Spacer(),
                Expanded(
                  flex: 5,
                  child: _lotNumberWidget(context),
                ),
              ],
            ),
          ),
          Expanded(
            child: _lotValueWidget(context),
          ),
        ],
      ),
    );
  }

  Row _remainingShareWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _remainingShare(context),
        SizedBox(width: 10),
        _remainingShareLabel(context),
      ],
    );
  }

  Widget _remainingShare(BuildContext context) {
    return Text(
      "${lot.remainingShare}",
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _remainingShareLabel(BuildContext context) {
    return Text(
      "الأسهم المتبقية:",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
    );
  }

  Row _lotNumberWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        _lotNumber(context),
        SizedBox(width: 10),
        _lotNumberLabel(context),
      ],
    );
  }

  Widget _lotNumber(BuildContext context) {
    return Text(
      lot.lotNumber,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
    );
  }

  Widget _lotNumberLabel(BuildContext context) {
    return Text(
      "الرقم:",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
      textDirection: TextDirection.rtl,
    );
  }

  Row _lotValueWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        _lotValue(context),
        SizedBox(width: 10),
        _lotValueLabel(context),
      ],
    );
  }

  Widget _lotValue(BuildContext context) {
    final formattedValue = intl.NumberFormat("#,###").format(lot.value);
    return Text(
      formattedValue,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
    );
  }

  Widget _lotValueLabel(BuildContext context) {
    return Text(
      "قيمة:",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
    );
  }

  Widget _rowNumber(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        ".${index + 1}",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }
}
