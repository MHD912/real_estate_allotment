import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';

class CustomTypeAHeadField extends StatelessWidget {
  final InputFormat inputFormat;
  final TextEditingController controller;
  final Future<List<String?>> Function(String) suggestionsCallback;
  final SuggestionsController<String>? suggestionsController;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode, nextNode;
  final bool autofocus;
  final bool? enabled;
  const CustomTypeAHeadField({
    super.key,
    required this.controller,
    required this.inputFormat,
    required this.suggestionsCallback,
    this.suggestionsController,
    this.onEditingComplete,
    this.focusNode,
    this.nextNode,
    this.autofocus = false,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      onSelected: (value) {
        controller.text = "$value";
        suggestionsController?.close();
        nextNode?.requestFocus();
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
      focusNode: focusNode,
      controller: controller,
      suggestionsController: suggestionsController,
      hideOnEmpty: true,
      builder: (context, controller, focusNode) => CustomTextField(
        enabled: enabled,
        autofocus: autofocus,
        focusNode: focusNode,
        controller: controller,
        inputFormat: inputFormat,
        onEditingComplete: onEditingComplete,
      ),
      decorationBuilder: (context, child) => Material(
        color: AppTheme.darkGrayColor,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: child,
      ),
      itemSeparatorBuilder: (context, index) => Divider(
        color: Theme.of(context).colorScheme.outline,
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
