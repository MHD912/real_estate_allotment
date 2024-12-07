import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';

class CustomLabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String label;
  final InputFormat inputFormat;
  final bool autofocus;
  final void Function()? onEditingComplete;

  const CustomLabeledTextField({
    super.key,
    this.focusNode,
    required this.controller,
    required this.label,
    this.inputFormat = InputFormat.normal,
    this.onEditingComplete,
    this.autofocus = false,
  });

  final Duration _animationDuration = const Duration(milliseconds: 200);

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
          AnimatedContainer(
            duration: _animationDuration,
            width: textFieldWidth(),
            child: CustomTextField(
              autofocus: autofocus,
              focusNode: focusNode,
              controller: controller,
              inputFormat: inputFormat,
              onEditingComplete: onEditingComplete,
            ),
          ),
          // Expanded(
          AnimatedContainer(
            duration: _animationDuration,
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
        ],
      ),
    );
  }

  double textFieldWidth() => AppLayout.width(575);

  double labelWidth() => AppLayout.width(190);
}
