import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/routes/app_routes.dart';
import 'package:flutter_base_project/view/settings_page.dart';
import 'package:flutter_base_project/view/settings_page_details.dart';

class SettingsNavigator extends StatelessWidget {
  const SettingsNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(2),
      //initialRoute: AppRoutes.settings,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.settings:
            return GetPageRoute(
              settings: settings,
              page: () => const SettingsScreen(),
            );
          case AppRoutes.settingsDetail:
            return GetPageRoute(
              settings: settings,
              page: () => const SettingsDetailScreen(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              page: () => const SettingsScreen(),
            );
        }
      },
    );
  }
}