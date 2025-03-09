import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/export_excel_controller.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';
import 'package:real_estate_allotment/core/utilities/validate_study.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/dialogs/export_error_dialog.dart';

class ExportExcel extends StatelessWidget {
  ExportExcel({super.key});

  final _controller = Get.put(
    ExportExcelController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: MaterialButton(
        onPressed: () async {
          final realEstateErrors = await ValidateStudy.validateRealEstates();
          final lotErrors = await ValidateStudy.validateLots();
          if (realEstateErrors.isNotEmpty || lotErrors.isNotEmpty) {
            Get.dialog(
              ExportErrorDialog(
                realEstateErrors: realEstateErrors,
                lotErrors: lotErrors,
              ),
              barrierDismissible: false,
            );
          } else {
            final success = await _controller.export();
            if (!context.mounted) return;
            if (success) {
              AppToast.show(
                context: context,
                type: AppToastType.success,
                description: "تم حفظ ملف Excel في مجلد مستنداتك.",
              );
            } else {
              AppToast.show(
                context: context,
                type: AppToastType.error,
                description: "لم نتمكن من حفظ ملف Excel.",
              );
            }
          }
        },
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: AppTheme.greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تصدير الدراسة",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.receipt_outlined,
              color: AppTheme.whiteColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
