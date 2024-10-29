import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool isDigitsOnly;
  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.isDigitsOnly,
  });

  @override
  Widget build(BuildContext context) {
    return _widgetContent(context);
  }

  Widget _widgetContent(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textAlign: TextAlign.end,
      inputFormatters:
          isDigitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        prefixIcon: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return (controller.value.text.isEmpty)
                ? SizedBox.shrink()
                : IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    // padding: const EdgeInsets.all(0),
                    icon: Icon(Icons.close),
                  );
          },
        ),
      ),
    );
  }
}
