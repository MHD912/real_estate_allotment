import 'package:flutter/material.dart';
import 'package:real_estate_allotment/controllers/studies/study_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';

abstract class StudyView extends StatelessWidget {
  abstract final String pageTitle;
  abstract final String submitButtonLabel;
  abstract final StudyController controller;
  const StudyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppWindowBorder(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: _viewContent(context),
        ),
      ),
    );
  }

  Widget _viewContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppLayout.height(100),
          ),
          child: _pageTitle(context),
        ),
        Spacer(),
        _propertyValueTextField(),
        _actionsRow(context),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle(BuildContext context) {
    return Text(
      pageTitle,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _propertyValueTextField() {
    return CustomLabeledTextField(
      label: "عنوان الدراسة",
      controller: controller.titleController,
    );
  }

  Widget _actionsRow(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _submitButton(context),
        ],
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () async => await onSubmitPressed(context),
      label: submitButtonLabel,
    );
  }

  Future<void> onSubmitPressed(BuildContext context);
}
