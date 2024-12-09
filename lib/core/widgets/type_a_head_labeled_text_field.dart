import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  final FocusNode? focusNode, nextNode;
  final bool autofocus;
  final bool? enabled;

  const TypeAHeadLabeledTextField({
    super.key,
    this.focusNode,
    this.nextNode,
    required this.label,
    this.inputFormat = InputFormat.normal,
    required this.controller,
    required this.suggestionsCallback,
    this.suggestionsController,
    this.onEditingComplete,
    this.autofocus = false,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return _widgetContent(context);
  }

  Widget _widgetContent(BuildContext context) {
    return SizedBox(
      height: AppLayout.height(83),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: textFieldWidth(),
            child: CustomTypeAHeadField(
              enabled: enabled,
              autofocus: autofocus,
              focusNode: focusNode,
              nextNode: nextNode,
              controller: controller,
              inputFormat: inputFormat,
              suggestionsCallback: suggestionsCallback,
              suggestionsController: suggestionsController,
              onEditingComplete: onEditingComplete,
            ),
          ),
          // Expanded(
          Container(
            width: labelWidth(),
            padding: EdgeInsets.only(left: 20),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
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
