extension SeparatedNumberExtension on String {
  double parseSeparatedDouble() {
    return double.parse(replaceAll(',', ''));
  }
}
