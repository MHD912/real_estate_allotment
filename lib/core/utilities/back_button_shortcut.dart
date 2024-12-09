import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EscapeIntent extends Intent {
  const EscapeIntent();
}

class BackButtonShortcut extends StatelessWidget {
  final Widget child;
  const BackButtonShortcut({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <SingleActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.escape): const EscapeIntent(),
      },
      child: Actions(
        dispatcher: ActionDispatcher(),
        actions: <Type, Action<EscapeIntent>>{
          EscapeIntent: CallbackAction(
            onInvoke: (intent) => Navigator.maybePop(context),
          ),
        },
        child: child,
      ),
    );
  }
}
