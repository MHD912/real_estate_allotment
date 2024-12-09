import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/controllers/studies/study_management_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_assets.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/custom_icon_button.dart';
import 'package:real_estate_allotment/models/study/study.dart';

class StudyItemWidget extends StatelessWidget {
  final _controller = Get.find<StudyManagementController>();
  final int index;
  final Study study;
  StudyItemWidget({
    super.key,
    required this.index,
    required this.study,
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
          _deleteButton(context),
          _editButton(),
          _openButton(),
          SizedBox(
            width: AppLayout.height(10),
          ),
          Expanded(
            flex: 2,
            child: _studyInfoBox(context),
          ),
          _rowNumber(context),
        ],
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return CustomIconButton(
      onPressed: () async {
        final success = await _controller.deleteStudy(
          studyId: study.id,
        );
        if (!context.mounted) return;
        if (success) {
          AppToast.show(
            context: context,
            type: AppToastType.success,
            description: "تم حذف العقار بنجاح.",
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
      iconSize: 40,
      iconPath: AppAssets.icons.deleteIcon,
      toolTip: "حذف",
    );
  }

  Widget _editButton() {
    return CustomIconButton(
      onPressed: () => Get.toNamed(
        AppRoutes.editStudy,
        arguments: {
          'study': study,
        },
      ),
      iconSize: 30,
      iconPath: AppAssets.icons.editIcon,
      toolTip: "تعديل",
    );
  }

  Widget _openButton() {
    return CustomIconButton(
      onPressed: () {
        Get.find<ActiveStudyController>().activeStudy = study;
        Get.offNamed(AppRoutes.hub);
      },
      iconSize: 30,
      iconPath: AppAssets.icons.openItemIcon,
      toolTip: "فتح",
    );
  }

  Widget _studyInfoBox(BuildContext context) {
    return Container(
      height: AppLayout.height(60),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
          _dateTime(context),
          Row(
            children: [
              _studyTitle(context),
              SizedBox(width: 10),
              _studyTitleLabel(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _studyTitle(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerRight,
      fit: BoxFit.fitHeight,
      child: Text(
        study.title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }

  Widget _studyTitleLabel(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerRight,
      fit: BoxFit.fitHeight,
      child: Text(
        "العنوان:",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _dateTime(BuildContext context) {
    String formattedDate = intl.DateFormat('h:mm a - dd/MMM/yyyy').format(
      study.dateCreated,
    );
    return FittedBox(
      alignment: Alignment.centerRight,
      fit: BoxFit.fitHeight,
      child: Text(
        formattedDate,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _rowNumber(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        ".${index + 1}",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
