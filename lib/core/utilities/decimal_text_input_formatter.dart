import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty, allow it
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Check if the new value matches our decimal pattern
    if (RegExp(r'^[0-9]+\.?[0-9]*$').hasMatch(newValue.text)) {
      return newValue;
    }

    // If it doesn't match, return the old value instead of clearing
    return oldValue;
  }
}
