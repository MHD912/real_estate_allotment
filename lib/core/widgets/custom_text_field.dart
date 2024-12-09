import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_allotment/core/utilities/decimal_text_input_formatter.dart';

enum InputFormat { normal, digits, decimal }

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final InputFormat inputFormat;
  final TextEditingController controller;
  final bool autofocus;
  final bool? enabled;

  final void Function()? onEditingComplete;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.inputFormat,
    this.onEditingComplete,
    this.focusNode,
    this.autofocus = false,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return _widgetContent(context);
  }

  Widget _widgetContent(BuildContext context) {
    return TextField(
      enabled: enabled,
      autofocus: autofocus,
      focusNode: focusNode,
      controller: controller,
      textDirection: TextDirection.rtl,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      inputFormatters: (inputFormat == InputFormat.normal)
          ? null
          : (inputFormat == InputFormat.digits)
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : [
                  DecimalTextInputFormatter(),
                ],
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      decoration: InputDecoration(
        prefixIcon: Visibility(
          visible: enabled ?? true,
          child: ListenableBuilder(
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
      ),
    );
  }
}
