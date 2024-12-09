import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_allotment/core/utilities/decimal_text_input_formatter.dart';
import 'package:real_estate_allotment/core/utilities/separated_number_formatter.dart';

enum InputFormat { normal, currency, digits, decimal }

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
    final List<TextInputFormatter>? inputFormattersList;
    switch (inputFormat) {
      case InputFormat.normal:
        inputFormattersList = null;
        break;
      case InputFormat.currency:
        inputFormattersList = [SeparatedNumberFormatter()];
        break;
      case InputFormat.digits:
        inputFormattersList = [FilteringTextInputFormatter.digitsOnly];
        break;
      case InputFormat.decimal:
        inputFormattersList = [DecimalTextInputFormatter()];
        break;
    }
    return TextField(
      enabled: enabled,
      autofocus: autofocus,
      focusNode: focusNode,
      controller: controller,
      textDirection: TextDirection.rtl,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormattersList,
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
