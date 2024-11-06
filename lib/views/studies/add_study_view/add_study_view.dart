import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/controllers/studies/add_study_controller.dart';
import 'package:real_estate_allotment/controllers/studies/study_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/views/studies/study_view.dart';

class AddStudyView extends StudyView {
  AddStudyView({super.key});

  @override
  final pageTitle = "إنشاء دراسة جديدة";

  @override
  final submitButtonLabel = "إضافة";

  @override
  final controller = Get.find<AddStudyController>();

  @override
  Future<void> onSubmitPressed(BuildContext context) async {
    final result = await controller.submitStudy();
    if (!context.mounted) return;
    switch (result) {
      case InputResult.success:
        AppToast.show(
          context: context,
          type: AppToastType.success,
          description: "تم إنشاء دراسة جديدة بنجاح.",
        );
        Get.find<ActiveStudyController>().activeStudy = controller.study;
        Get.offNamed(AppRoutes.hub);
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
          description: "لم نتمكن من إنشاء دراسة جديدة.",
        );
        break;
    }
  }
}
