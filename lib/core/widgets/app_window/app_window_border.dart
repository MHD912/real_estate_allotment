import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/widgets/app_window/window_widgets.dart';

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
      color: Theme.of(context).colorScheme.surface,
      child: SizedBox.expand(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 35,
              child: WindowTitleBarBox(
                child: Row(
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
