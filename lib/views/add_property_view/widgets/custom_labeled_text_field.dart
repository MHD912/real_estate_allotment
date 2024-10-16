import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';

class CustomLabeledTextField extends StatelessWidget {
  final Duration _animationDuration = const Duration(milliseconds: 200);
  final String label;
  const CustomLabeledTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return _widgetContent();
  }

  Widget _widgetContent() {
    return SizedBox(
      height: AppLayout.height(83),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSize(
            duration: _animationDuration,
            child: SizedBox(
              width: textFieldWidth(),
              child: CustomTextField(),
            ),
          ),
          // Expanded(
          AnimatedSize(
            duration: _animationDuration,
            child: Container(
              width: labelWidth(),
              padding: EdgeInsets.only(left: 20),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double textFieldWidth() => AppLayout.width(575);

  double labelWidth() => AppLayout.width(190);
}
