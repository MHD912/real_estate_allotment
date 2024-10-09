import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  "Real Estate Allotment",
                  style: Get.theme.textTheme.displayLarge,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    label: "فتح دراسة سابقة",
                    onPressed: () {},
                  ),
                  const SizedBox(width: 50),
                  CustomButton(
                    label: "دراسة جديدة",
                    onPressed: () => Get.toNamed('/hub'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
