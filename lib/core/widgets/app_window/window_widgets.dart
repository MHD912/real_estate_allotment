import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/back_controller.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/controllers/theme_controller.dart';
import 'package:real_estate_allotment/core/widgets/custom_icon_button.dart';
import 'package:real_estate_allotment/core/widgets/dialogs/manage_isar_dialog.dart';

class LeftSide extends StatelessWidget {
  final _themeController = Get.find<ThemeController>();
  LeftSide({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            children: [
              _backButton(context),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                margin: EdgeInsets.only(top: 3, bottom: 3, left: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    _manageDatabaseButton(context),
                    const SizedBox(width: 5),
                    _themeToggleButton(context),
                  ],
                ),
              ),
            ],
          ),
          WindowTitleBarBox(
            child: MoveWindow(),
          ),
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return GetBuilder<BackController>(
      builder: (controller) {
        return Visibility(
          visible: Navigator.canPop(context),
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 20),
            child: CustomIconButton(
              iconSize: 20,
              iconData: Icons.arrow_back,
              toolTip: "رجوع",
              onPressed: () => Navigator.maybePop(context).then(
                (value) => controller.update(),
              ),
            ),
          ),
        );
      },
    );
  }

  CustomIconButton _manageDatabaseButton(BuildContext context) {
    return CustomIconButton(
      iconSize: 35,
      color: Theme.of(context).colorScheme.onPrimary,
      iconPath: 'assets/icons/database_icon.svg',
      toolTip: "نسخ احتياطي",
      onPressed: () {
        Get.dialog(
          ManageIsarDialog(),
        );
      },
    );
  }

  CustomIconButton _themeToggleButton(BuildContext context) {
    return CustomIconButton(
      iconSize: 20,
      color: Theme.of(context).colorScheme.onPrimary,
      iconData: (_themeController.themeMode == ThemeMode.dark)
          ? Icons.light_mode
          : Icons.dark_mode,
      toolTip: (_themeController.themeMode == ThemeMode.dark)
          ? "سمة فاتحة"
          : "سمة داكنة",
      onPressed: () {
        if (_themeController.themeMode == ThemeMode.dark) {
          _themeController.setThemeMode(false);
        } else {
          _themeController.setThemeMode(true);
        }
      },
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
              GetBuilder<ActiveStudyController>(
                builder: (controller) => Text(
                  controller.activeStudy?.title ?? "Real Estate Allotment",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
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

WindowButtonColors buttonColors(BuildContext context) => WindowButtonColors(
      iconNormal: Theme.of(context).colorScheme.onSurface,
      mouseOver: Colors.green.shade500,
      mouseDown: Colors.green.shade700,
    );

WindowButtonColors closeButtonColors(BuildContext context) =>
    WindowButtonColors(
      iconNormal: Theme.of(context).colorScheme.onSurface,
      mouseOver: Colors.red,
      mouseDown: Colors.red.shade800,
    );

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: buttonColors(context),
        ),
        MaximizeWindowButton(
          colors: buttonColors(context),
        ),
        CloseWindowButton(
          colors: closeButtonColors(context),
        ),
      ],
    );
  }
}
