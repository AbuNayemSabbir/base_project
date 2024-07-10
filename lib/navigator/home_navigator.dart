import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/routes/app_routes.dart';
import 'package:flutter_base_project/view/home_page.dart';
import 'package:flutter_base_project/view/home_page_details.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
     // initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.home:
            return GetPageRoute(
              settings: settings,
              page: () =>  const HomeScreen(),
            );
          case AppRoutes.homeDetail:
            return GetPageRoute(
              settings: settings,
              page: () => const HomeDetailScreen(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              page: () =>  const HomeScreen(),
            );
        }
      },
    );
  }
}