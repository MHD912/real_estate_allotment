import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_management_service.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';

class ManageIsarDialog extends StatelessWidget {
  final backupService = IsarManagementService();
  ManageIsarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
      buttonPadding: EdgeInsets.all(20),
      actionsAlignment: MainAxisAlignment.center,
      icon: SvgPicture.asset(
        'assets/icons/database_icon.svg',
        height: 40,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        "إدارة قاعدة البيانات",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
      content: Text(
        "قم بإنشاء نسخة احتياطية لبيانات البرنامج"
        "\n"
        "أو قم باستعادة نسخة موجودة مسبقاً",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
      actions: [
        CustomTextButton(
          label: "تصدير",
          onPressed: () async {
            final exportedFile = await backupService.exportDatabaseToJson();
            if (!context.mounted) return;
            if (exportedFile != null) {
              // Show success dialog
              AppToast.show(
                context: context,
                type: AppToastType.success,
                description: "تم تصدير قاعدة البيانات إلى المسار التالي:\n"
                    "${exportedFile.path}",
              );
            } else {
              // Show error dialog
              AppToast.show(
                context: context,
                type: AppToastType.error,
                description: "فشل تصدير قاعدة البيانات!",
              );
            }
          },
        ),
        CustomTextButton(
          label: "استيراد",
          onPressed: () async {
            final success = await backupService.importDatabaseFromJsonFile();
            if (!context.mounted) return;
            if (success) {
              // Show success dialog
              AppToast.show(
                context: context,
                type: AppToastType.success,
                description: "تم استيراد قاعدة البيانات بنجاح",
              );
              Get.back();
            } else {
              // Show error dialog
              AppToast.show(
                context: context,
                type: AppToastType.error,
                description: "فشل استرجاع قاعدة البيانات!",
              );
            }
          },
        ),
      ],
    );
  }
}
