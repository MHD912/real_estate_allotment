import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/type_a_head_labeled_text_field.dart';

class AnimatedCustomLabeledTextField extends TypeAHeadLabeledTextField {
  final bool isExpanded;
  const AnimatedCustomLabeledTextField({
    super.key,
    required super.label,
    required super.focusNode,
    required super.nextNode,
    required this.isExpanded,
    required super.controller,
    required super.suggestionsCallback,
    super.suggestionsController,
    super.onEditingComplete,
  });

  @override
  double textFieldWidth() {
    return AppLayout.width(
      (isExpanded) ? 575 : 450,
    );
  }

  @override
  double labelWidth() {
    return AppLayout.width(170);
  }
}
