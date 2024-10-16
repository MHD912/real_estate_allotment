import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/widgets/custom_outlined_button.dart';

class HomeContentTemplate extends StatelessWidget {
  final String pageTitle;
  final String leftButtonLabel;
  final String rightButtonLabel;
  final void Function() leftButtonOnPressed;
  final void Function() rightButtonOnPressed;

  const HomeContentTemplate({
    super.key,
    required this.pageTitle,
    required this.leftButtonLabel,
    required this.leftButtonOnPressed,
    required this.rightButtonLabel,
    required this.rightButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Flexible(
          child: _titleWidget(),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 3,
          child: _actionsSection(),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  Row _actionsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _leftButton(),
        const SizedBox(width: 50),
        _rightButton(),
      ],
    );
  }

  Text _titleWidget() {
    return Text(
      pageTitle,
      style: Get.theme.textTheme.displayMedium,
    );
  }

  CustomOutlinedButton _leftButton() {
    return CustomOutlinedButton(
      label: leftButtonLabel,
      onPressed: leftButtonOnPressed,
    );
  }

  CustomOutlinedButton _rightButton() {
    return CustomOutlinedButton(
      label: rightButtonLabel,
      onPressed: rightButtonOnPressed,
    );
  }
}
