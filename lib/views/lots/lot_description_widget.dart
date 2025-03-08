import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/core/theme/input_decoration_theme.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class LotDescriptionWidget extends StatelessWidget {
  final LotController controller;
  LotDescriptionWidget({super.key, required this.controller});

  final List<String> options = [
    "سكني / الكامل",
    "سكني / رقبة",
    "سكني / انتفاع",
    "تجاري / الكامل",
    "تجاري / فروغ",
    "تجاري / رقبة",
    "تجاري / انتفاع",
    "تجاري / ملكية",
    "أرض",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppLayout.height(83),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: AppLayout.width(575),
            alignment: Alignment.centerRight,
            child: DropdownMenu<String>(
              hintText: "لا يوجد",
              enableFilter: true,
              textAlign: TextAlign.end,
              initialSelection: null,
              controller: controller.lotDescriptionController,
              onSelected: (value) {
                controller.lotDescriptionController.text = value ?? "";
              },
              menuHeight: AppLayout.height(250),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primaryContainer,
                ),
                side: WidgetStatePropertyAll(
                  BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              inputDecorationTheme: (context.isDarkMode)
                  ? darkInputDecorationTheme
                  : lightInputDecorationTheme,
              dropdownMenuEntries: options
                  .map(
                    (value) => _menuItem(value),
                  )
                  .toList(),
            ),
          ),
          // Expanded(
          Container(
            width: AppLayout.width(190),
            padding: EdgeInsets.only(left: 20),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "الوصف",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuEntry<String> _menuItem(String value) {
    return DropdownMenuEntry(
      value: value,
      label: value,
      labelWidget: Container(
        width: double.infinity,
        alignment: Alignment.centerRight,
        child: Text(
          value,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
