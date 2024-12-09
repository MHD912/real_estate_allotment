import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class SeparatedNumberFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,##0');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value is empty, return it as is
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove any non-digit characters
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // If cleaned text is empty after removing non-digits, return empty
    if (cleanedText.isEmpty) {
      return TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Convert to integer to remove leading zeros
    int numericValue = int.parse(cleanedText);

    // Format the number with thousands separator
    String formattedText = _formatter.format(numericValue);

    // Calculate the new cursor position
    int cursorPosition = formattedText.length;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
