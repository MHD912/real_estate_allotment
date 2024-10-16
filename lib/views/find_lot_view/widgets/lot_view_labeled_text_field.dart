import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/views/add_property_view/widgets/custom_labeled_text_field.dart';

class LotViewLabeledTextField extends CustomLabeledTextField {
  final bool isExpanded;
  const LotViewLabeledTextField({
    super.key,
    required super.label,
    required this.isExpanded,
  });

  @override
  double textFieldWidth() {
    return AppLayout.width(
      (isExpanded) ? 575 : 450,
    );
  }

  @override
  double labelWidth() {
    return AppLayout.width(150);
  }
}
