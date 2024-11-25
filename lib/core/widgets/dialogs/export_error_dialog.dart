import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';

class ExportErrorDialog extends StatelessWidget {
  final String realEstateErrors;
  final String lotErrors;
  const ExportErrorDialog({
    super.key,
    required this.realEstateErrors,
    required this.lotErrors,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      title: Text(
        'قم بمعالجة الأخطاء التالية قبل أن تتمكن من تصدير الدراسة',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      content: Container(
        height: deviceHeight * 0.6,
        width: deviceWidth * 0.4,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outline,
          borderRadius: BorderRadius.circular(25),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "أخطاء العقارات:",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                (realEstateErrors.isEmpty) ? "لا يوجد" : realEstateErrors,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Divider(
                color: AppTheme.grayColor,
              ),
              Text(
                "أخطاء المقاسم:",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                (lotErrors.isEmpty) ? "لا يوجد" : lotErrors,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        MaterialButton(
          onPressed: () => Get.back(),
          color: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
          child: Text(
            "إغلاق",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
