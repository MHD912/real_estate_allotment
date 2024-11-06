import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_allotment/core/utilities/decimal_text_input_formatter.dart';

enum InputFormat { normal, digits, decimal }

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final InputFormat inputFormat;
  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.inputFormat,
  });

  @override
  Widget build(BuildContext context) {
    return _widgetContent(context);
  }

  Widget _widgetContent(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textDirection: TextDirection.rtl,
      inputFormatters: (inputFormat == InputFormat.normal)
          ? null
          : (inputFormat == InputFormat.digits)
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : [
                  DecimalTextInputFormatter(),
                ],
      decoration: InputDecoration(
        prefixIcon: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return (controller.text.isEmpty)
                ? SizedBox.shrink()
                : IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: Icon(Icons.close),
                  );
          },
        ),
      ),
    );
  }
}
