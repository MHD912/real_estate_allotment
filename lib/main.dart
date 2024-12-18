import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/theme_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';
import 'package:real_estate_allotment/core/utilities/app_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MainApp());

  // Implementation of `bitsdojo_window`
  doWhenWindowReady(
    () {
      const initialSize = Size(1280, 720);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.title = "Real Estate Allotment";
      appWindow.show();
    },
  );
}

Future<void> initServices() async {
  await Get.putAsync(
    () => IsarService.init(),
  );
  await Get.putAsync(
    () => ThemeController.init(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: controller.themeMode,
          getPages: AppRoutes.pages,
          initialBinding: AppBindings(),
          initialRoute: AppRoutes.home,
        );
      },
    );
  }
}
