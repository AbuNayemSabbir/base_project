import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/controller/nav_controller.dart';
import 'package:flutter_base_project/routes/app_routes.dart';
import 'package:flutter_base_project/view/helper_widget/custom_elevated_button.dart';

import 'helper_widget/custom_app_bar.dart';
import 'helper_widget/custom_buttom_navigation_bar.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings Screen',),
      body: Center(
        child: CustomElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.settingsDetail, id: 2);
          },
          text: 'Go to Detail',
        ),
      ),

    );
  }
}
