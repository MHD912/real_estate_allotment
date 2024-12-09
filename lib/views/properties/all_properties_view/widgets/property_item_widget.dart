import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/all_properties_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_assets.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/custom_icon_button.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class PropertyItemWidget extends StatelessWidget {
  final _controller = Get.find<AllPropertiesController>();
  final int index;
  final RealEstate property;
  PropertyItemWidget({
    super.key,
    required this.index,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return _widgetContent(context);
  }

  Widget _widgetContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppLayout.height(20),
      ),
      child: Row(
        children: [
          Spacer(
            flex: 3,
          ),
          _deleteButton(context),
          _editButton(),
          SizedBox(
            width: AppLayout.height(10),
          ),
          Expanded(
            flex: 10,
            child: _propertyInfoBox(context),
          ),
          Expanded(
            flex: 4,
            child: _rowNumber(context),
          ),
        ],
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return CustomIconButton(
      onPressed: () async {
        final result = await _controller.deleteProperty(
          propertyId: property.id,
        );
        if (!context.mounted) return;

        switch (result) {
          case DeleteResult.success:
            AppToast.show(
              context: context,
              type: AppToastType.success,
              description: "تم حذف العقار بنجاح.",
            );
            break;
          case DeleteResult.lotError:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description:
                  "لم نتمكن من حذف العقار بسبب حدوث خطأ أثناء حذف المقاسم المرتبطة به.",
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
                  "لم نتمكن من حذف العقار بسبب حدوث خطأ أثناء حذف الاختصاصات المرتبطة به.",
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
        AppRoutes.editProperty,
        arguments: {
          'property': property,
        },
      ),
      iconSize: 30,
      iconPath: AppAssets.icons.editIcon,
      toolTip: "تعديل",
    );
  }

  Widget _propertyInfoBox(BuildContext context) {
    return Container(
      height: AppLayout.height(60),
      padding: EdgeInsets.symmetric(vertical: 5),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Expanded(
                  child: _propertyNumber(context),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: _propertyNumberLabel(context),
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
                Expanded(
                  flex: 3,
                  child: _city(context),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: _cityLabel(context),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _propertyNumber(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerRight,
      fit: BoxFit.fitHeight,
      child: Text(
        property.propertyNumber,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      ),
    );
  }

  Widget _propertyNumberLabel(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerRight,
      fit: BoxFit.fitHeight,
      child: Text(
        "العقار رقم:",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _city(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerRight,
      fit: BoxFit.fitHeight,
      child: Text(
        property.city,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _cityLabel(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerRight,
      fit: BoxFit.fitHeight,
      child: Text(
        "المنطقة:",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _rowNumber(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        ".${index + 1}",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      ),
    );
  }
}
