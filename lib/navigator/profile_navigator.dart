import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/routes/app_routes.dart';
import 'package:flutter_base_project/view/profile_page.dart';
import 'package:flutter_base_project/view/profile_page_details.dart';

class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(3),
     // initialRoute: AppRoutes.profile,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.profile:
            return GetPageRoute(
              settings: settings,
              page: () =>  ProfileScreen(),
            );
          case AppRoutes.profileDetail:
            return GetPageRoute(
              settings: settings,
              page: () => const ProfileDetailScreen(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              page: () =>  ProfileScreen(),
            );
        }
      },
    );
  }
}