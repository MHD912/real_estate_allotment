import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/add_property_view/widgets/custom_labeled_text_field.dart';

class AddPropertyView extends StatelessWidget {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return _viewContent(context);
  }

  Widget _viewContent(BuildContext context) {
    return Scaffold(
      body: AppWindowBorder(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: AppLayout.height(70),
                      bottom: AppLayout.height(160),
                    ),
                    child: Text(
                      "إضافة عقار جديد",
                      style: Get.theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 6,
                        children: [
                          CustomLabeledTextField(
                            label: "قيمة العقار",
                          ),
                          CustomLabeledTextField(
                            label: "رقم العقار",
                          ),
                          CustomLabeledTextField(
                            label: "الحصة الكلية",
                          ),
                          CustomLabeledTextField(
                            label: "المنطقة",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextButton(
                          label: "حفظ",
                          backgroundColor: AppTheme.greenColor,
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: AppLayout.width(60),
                        ),
                        CustomTextButton(
                          label: "إعادة تعيين",
                          backgroundColor: AppTheme.darkGrayColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              HubButton(),
            ],
          ),
        ),
      ),
    );
  }
}
