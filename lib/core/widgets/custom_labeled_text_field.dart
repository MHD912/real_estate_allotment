import 'package:flutter/material.dart';
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
            child: CustomTextField(
              autofocus: autofocus,
              focusNode: focusNode,
              controller: controller,
              inputFormat: inputFormat,
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
                      overflow: TextOverflow.ellipsis,
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
