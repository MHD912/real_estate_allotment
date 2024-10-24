import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_assets.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_icon_button.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class PropertyItemWidget extends StatelessWidget {
  final int index;
  final RealEstate property;
  const PropertyItemWidget({
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
          Spacer(),
          _deleteButton(),
          _editButton(),
          SizedBox(
            width: AppLayout.height(10),
          ),
          Expanded(
            flex: 2,
            child: _propertyInfoBox(),
          ),
          _rowNumber(),
          Spacer(),
        ],
      ),
    );
  }

  Widget _deleteButton() {
    return CustomIconButton(
      iconSize: 40,
      iconPath: AppAssets.icons.deleteIcon,
      onPressed: () {},
    );
  }

  Widget _editButton() {
    return CustomIconButton(
      iconSize: 30,
      iconPath: AppAssets.icons.editIcon,
      onPressed: () => Get.toNamed(
        AppRoutes.editProperty,
      ),
    );
  }

  Widget _propertyInfoBox() {
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
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                _propertyId(),
                SizedBox(width: 10),
                _propertyIdLabel(),
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
                _city(),
                SizedBox(width: 10),
                _cityLabel(),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _propertyId() {
    return Expanded(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          "${property.propertyId}",
          style: Get.theme.textTheme.titleMedium,
        ),
      ),
    );
  }

  Widget _propertyIdLabel() {
    return Expanded(
      flex: 3,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          "العقار رقم:",
          style: Get.theme.textTheme.titleMedium?.copyWith(
            color: Get.theme.colorScheme.primary,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  Widget _city() {
    return Expanded(
      flex: 3,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          property.city,
          style: Get.theme.textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _cityLabel() {
    return Expanded(
      flex: 2,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          "المنطقة:",
          style: Get.theme.textTheme.titleMedium?.copyWith(
            color: Get.theme.colorScheme.primary,
          ),
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
        ),
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
