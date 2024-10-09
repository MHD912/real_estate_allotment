import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          (Get.currentRoute != '/home')
              ? Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: BackButton(
                    color: Colors.white,
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      padding: WidgetStatePropertyAll(EdgeInsets.all(5)),
                      iconSize: WidgetStatePropertyAll(20),
                    ),
                  ),
                )
              : SizedBox(),
          WindowTitleBarBox(
            child: MoveWindow(),
          ),
        ],
      ),
    );
  }
}

class MiddleSide extends StatelessWidget {
  const MiddleSide({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                "Real Estate Allotment",
                style: Get.theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              WindowTitleBarBox(
                child: MoveWindow(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
                  ),
                  const WindowButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
  iconNormal: Get.theme.colorScheme.onSurface,
  mouseOver: Colors.green.shade500,
  mouseDown: Colors.green.shade700,
);

final closeButtonColors = WindowButtonColors(
  iconNormal: Get.theme.colorScheme.onSurface,
  mouseOver: Colors.red,
  mouseDown: Colors.red.shade800,
);

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
