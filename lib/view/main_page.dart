import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/controller/nav_controller.dart';
import 'package:flutter_base_project/controller/user_controller.dart';
import 'package:flutter_base_project/navigator/home_navigator.dart';
import 'package:flutter_base_project/navigator/profile_navigator.dart';
import 'package:flutter_base_project/navigator/setting_navigator.dart';
import 'package:flutter_base_project/routes/app_routes.dart';
import 'package:flutter_base_project/services/base_api_services.dart';
import 'package:flutter_base_project/view/helper_widget/custom_drawer.dart';

import 'helper_widget/custom_app_bar.dart';
import 'helper_widget/custom_buttom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  final List<String> routes = [
    AppRoutes.home,
    AppRoutes.settings,
    AppRoutes.profile
  ];

  MainPage({super.key});
  final NavController navController = Get.find();
  final UserController userController = Get.put(UserController(BaseApiService()));


  @override
  Widget build(BuildContext context) {
   return
     SafeArea(
       child: PopScope(
         canPop: false,
         onPopInvoked: (didPop) {
       if (didPop) {
         return;
       } else {
         final navController = Get.find<NavController>();
         if (navController.selectedIndex.value != 0) {
           navController.selectedIndex.value = 0;
           return ;
         }else {
           SystemNavigator.pop();
         }
       }
          },
       child: Scaffold(
         key: navController.key,
         body: Obx(() => IndexedStack(
            index: navController.selectedIndex.value,
            children: const [
              HomeNavigator(),
              SettingsNavigator(),
              ProfileNavigator(),
            ],
          )),
         drawer:  CustomDrawer(),
         bottomNavigationBar: Obx(() => CustomBottomNavigationBar(
           selectedIndex: navController.selectedIndex.value,
           onItemSelected: (index) {
             navController.selectedIndex.value = index;
             if(index==2){
               userController.fetchUsers();
             }
           },
         )),
        ),
          ),
     );
  }
}