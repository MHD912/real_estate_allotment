import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/templates/home_content_template.dart';

class AllotmentsView extends StatelessWidget {
  const AllotmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContentTemplate(
      pageTitle: "إدارة الاختصاص",
      leftButtonLabel: "إضافة اختصاص",
      leftButtonOnPressed: () {},
      rightButtonLabel: "عرض الاختصاص",
      rightButtonOnPressed: () {},
    );
  }
}
