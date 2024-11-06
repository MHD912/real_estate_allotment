import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/studies/study_controller.dart';
import 'package:real_estate_allotment/controllers/studies/edit_study_controller.dart';
import 'package:real_estate_allotment/controllers/studies/study_management_controller.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/views/studies/study_view.dart';

class EditStudyView extends StudyView {
  EditStudyView({super.key}) {
    controller.study = Get.arguments['study'];
    controller.resetInput();
  }

  @override
  final pageTitle = "إعادة تسمية الدراسة";

  @override
  final submitButtonLabel = "حفظ";

  @override
  final controller = Get.find<EditStudyController>();

  @override
  Future<void> onSubmitPressed(BuildContext context) async {
    final result = await controller.submitStudy();
    if (!context.mounted) return;
    switch (result) {
      case InputResult.success:
        AppToast.show(
          context: context,
          type: AppToastType.success,
          description: "تم تغيير اسم الدراسة بنجاح.",
        );
        Get.find<StudyManagementController>().update();
        Get.back();
        break;
      case InputResult.requiredInput:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "يجب تعبئة كافة الحقول.",
        );
        break;
      case InputResult.duplicateName:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "توجد دراسة مسجل مسبقاً بهذا الاسم.",
        );
        break;
      case InputResult.error:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "لم نتمكن من تغيير اسم الدراسة.",
        );
        break;
    }
  }
}
