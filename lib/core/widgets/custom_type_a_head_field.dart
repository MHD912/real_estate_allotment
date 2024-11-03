import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';

class CustomTypeAHeadField extends StatelessWidget {
  final TextEditingController controller;
  final InputFormat inputFormat;
  final Future<List<String?>> Function(String) suggestionsCallback;
  final SuggestionsController<String>? suggestionsController;
  const CustomTypeAHeadField({
    super.key,
    required this.controller,
    required this.inputFormat,
    required this.suggestionsCallback,
    this.suggestionsController,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      onSelected: (value) {
        controller.text = "$value";
        suggestionsController?.close();
      },
      suggestionsCallback: suggestionsCallback,
      itemBuilder: (context, value) {
        if (value == null) {
          return SizedBox.shrink();
        } else {
          return ListTile(
            title: Text(
              value,
              style: Get.textTheme.bodyLarge,
              textDirection: TextDirection.rtl,
            ),
          );
        }
      },
      controller: controller,
      suggestionsController: suggestionsController,
      hideOnEmpty: true,
      builder: (context, controller, focusNode) => CustomTextField(
        controller: controller,
        focusNode: focusNode,
        inputFormat: inputFormat,
      ),
      decorationBuilder: (context, child) => Material(
        color: Get.theme.colorScheme.primaryContainer,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
      itemSeparatorBuilder: (context, index) => Divider(
        color: Get.theme.colorScheme.outline,
        height: 1,
        thickness: 0.5,
        indent: 10,
        endIndent: 10,
      ),
      constraints: BoxConstraints(
        maxHeight: AppLayout.height(225),
      ),
    );
  }
}
