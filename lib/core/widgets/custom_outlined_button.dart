import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final widgetWidth = AppLayout.width(280);
    final widgetHeight = widgetWidth * (3 / 4);
    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
      ),
    );
  }
}
