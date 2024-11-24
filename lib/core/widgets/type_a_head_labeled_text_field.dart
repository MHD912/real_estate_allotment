import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/custom_type_a_head_field.dart';

class TypeAHeadLabeledTextField extends StatelessWidget {
  final String label;
  final InputFormat inputFormat;
  final TextEditingController controller;
  final Future<List<String?>> Function(String input) suggestionsCallback;
  final SuggestionsController<String>? suggestionsController;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final bool autofocus;
  const TypeAHeadLabeledTextField({
    super.key,
    this.focusNode,
    required this.label,
    this.inputFormat = InputFormat.normal,
    required this.controller,
    required this.suggestionsCallback,
    this.suggestionsController,
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
            child: CustomTypeAHeadField(
              autofocus: autofocus,
              focusNode: focusNode,
              controller: controller,
              inputFormat: inputFormat,
              suggestionsCallback: suggestionsCallback,
              suggestionsController: suggestionsController,
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
