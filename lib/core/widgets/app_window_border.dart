import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/widgets/window_widgets.dart';

class AppWindowBorder extends StatelessWidget {
  final Widget child;
  const AppWindowBorder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return WindowBorder(
      width: 5,
      color: Get.theme.colorScheme.surface,
      child: SizedBox.expand(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 35,
              child: WindowTitleBarBox(
                child: const Row(
                  children: <Widget>[
                    LeftSide(),
                    MiddleSide(),
                    RightSide(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
