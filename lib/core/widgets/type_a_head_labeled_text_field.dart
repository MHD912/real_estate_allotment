import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_type_a_head_field.dart';

class TypeAHeadLabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isDigitsOnly;
  final Future<List<String?>> Function(String) suggestionsCallback;
  final SuggestionsController<String>? suggestionsController;
  const TypeAHeadLabeledTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isDigitsOnly = false,
    required this.suggestionsCallback,
    this.suggestionsController,
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
              controller: controller,
              isDigitsOnly: isDigitsOnly,
              suggestionsCallback: suggestionsCallback,
              suggestionsController: suggestionsController,
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
