import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_assets.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';

class HubButton extends StatelessWidget {
  const HubButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppLayout.height(25)),
      child: IconButton(
        onPressed: () {
          Get.until(
            (route) => Get.currentRoute == AppRoutes.hub,
          );
        },
        padding: EdgeInsets.all(AppLayout.height(20)),
        color: Get.theme.colorScheme.onPrimaryContainer,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Get.theme.colorScheme.primaryContainer,
          ),
          maximumSize: WidgetStatePropertyAll(
            Size.square(
              AppLayout.height(90),
            ),
          ),
          shape: WidgetStatePropertyAll(
            CircleBorder(
              side: BorderSide(
                color: Get.theme.colorScheme.primary,
                strokeAlign: BorderSide.strokeAlignOutside,
                width: 2,
              ),
            ),
          ),
        ),
        icon: SvgPicture.asset(
          AppAssets.icons.homeIcon,
          colorFilter: ColorFilter.mode(
            Get.theme.colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
