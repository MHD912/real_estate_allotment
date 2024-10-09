import 'package:flutter/material.dart';

class LotsView extends StatelessWidget {
  const LotsView({super.key});

  @override
  Widget build(BuildContext context) {
    return _viewContent(context);
  }

  Widget _viewContent(BuildContext context) {
    return Center(
      child: Text(
        "مقاسم!",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 35,
          color: Colors.green.shade500,
        ),
      ),
    );
  }
}
