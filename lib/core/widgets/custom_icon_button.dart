import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

///
/// To use this widget you must provide a [String] for `iconPath` or an
/// [IconData] for `iconData` (e.g. predefined values in [Icons] class).
/// If both are provided at the same time, the `iconPath` takes higher priority.
/// If neither of values is provided, then a default [IconData] is used.
///
class CustomIconButton extends StatelessWidget {
  final double iconSize;
  final String? iconPath;
  final IconData? iconData;
  final void Function() onPressed;
  final String? toolTip;
  final Color? color;
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.iconSize,
    this.iconPath,
    this.iconData,
    this.toolTip,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      icon: (iconPath != null)
          ? SvgPicture.asset(
              iconPath!,
              height: AppLayout.height(iconSize),
              colorFilter: ColorFilter.mode(
                color ?? Theme.of(context).colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            )
          : (iconData != null)
              ? Icon(iconData!)
              : Icon(Icons.close),
      tooltip: toolTip,
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        padding: WidgetStatePropertyAll(EdgeInsets.all(5)),
        iconSize: WidgetStatePropertyAll(iconSize),
      ),
    );
  }
}
