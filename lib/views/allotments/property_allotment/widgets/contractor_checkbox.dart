import 'package:flutter/material.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/property_allotment_controller.dart';

class ContractorCheckbox extends StatelessWidget {
  final PropertyAllotmentController controller;
  const ContractorCheckbox({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: CheckboxListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            "اختصاص لمتعهد",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        value: controller.isContractor,
        onChanged: (newValue) {
          controller.toggleContractor();
        },
      ),
    );
  }
}
