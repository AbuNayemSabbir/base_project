import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_base_project/controller/nav_controller.dart';
import 'package:flutter_base_project/routes/app_routes.dart';
import 'package:flutter_base_project/utills/theme.dart';

import 'controller/theme_controller.dart';

void main() async {
  await GetStorage.init();
  Get.put(NavController());
  Get.put(ThemeController());
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(() {
        return GetMaterialApp(
          theme: TTheme.lightTheme,
          darkTheme: TTheme.darkTheme,
          themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: AppRoutes.routes,
        );
      }
    );
  }
}