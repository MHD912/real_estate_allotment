import 'package:flutter/material.dart';

class AllotmentsView extends StatelessWidget {
  const AllotmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return _viewContent(context);
  }

  Widget _viewContent(BuildContext context) {
    return Center(
      child: Text(
        "اختصاصات!",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 35,
          color: Colors.green.shade500,
        ),
      ),
    );
  }
}
