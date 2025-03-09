import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';
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
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            (context.isDarkMode) ? AppTheme.blackColor : AppTheme.greenColor,
          ),
          maximumSize: WidgetStatePropertyAll(
            Size.square(
              AppLayout.height(90),
            ),
          ),
          shape: WidgetStatePropertyAll(
            CircleBorder(
              side: BorderSide(
                color: (context.isDarkMode)
                    ? AppTheme.greenColor
                    : AppTheme.whiteColor,
                strokeAlign: BorderSide.strokeAlignOutside,
                width: 2,
              ),
            ),
          ),
        ),
        icon: SvgPicture.asset(
          AppAssets.icons.homeIcon,
          colorFilter: ColorFilter.mode(
            (context.isDarkMode) ? AppTheme.greenColor : AppTheme.whiteColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
