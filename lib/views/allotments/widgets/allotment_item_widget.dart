import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_assets.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_icon_button.dart';

class AllotmentItemWidget extends StatelessWidget {
  const AllotmentItemWidget({super.key});

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
          Spacer(
            flex: 2,
          ),
          _deleteButton(),
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
        onPressed: onPressedEditButton);
  }

  void onPressedEditButton() {}

  Widget _propertyInfoBox() {
    return Container(
      height: AppLayout.height(60),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
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
      child: _ownerName(),
    );
  }

  Widget _ownerName() {
    return FittedBox(
      alignment: Alignment.centerRight,
      child: Text(
        "محمد حسين أيمن حامد",
        style: Get.theme.textTheme.titleMedium,
        // textAlign: TextAlign.end,
      ),
    );
  }

  Widget _rowNumber() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        ".1",
        style: Get.theme.textTheme.titleMedium,
      ),
    );
  }
}
