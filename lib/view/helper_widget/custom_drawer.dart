import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/controller/nav_controller.dart';
import 'package:flutter_base_project/controller/theme_controller.dart';
import 'package:flutter_base_project/controller/user_controller.dart';
import 'package:flutter_base_project/services/base_api_services.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final UserController userController =
      Get.put(UserController(BaseApiService()));
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.cyan,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Navigation Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.find<NavController>().selectedIndex.value = 0;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.find<NavController>().selectedIndex.value = 1;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Get.find<NavController>().selectedIndex.value = 2;
              Navigator.pop(context);
              userController.fetchUsers();
            },
          ),
          Obx(() {
              return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Dark Mode'),
                      Switch(
                        activeColor: Colors.cyan,
                        splashRadius: 10,
                        value: themeController.isDarkMode.value,
                        onChanged: (value) {
                          themeController.toggleTheme();
                        },
                      )
                    ],
                  ),
                  leading:  Icon(themeController.isDarkMode.value?Icons.dark_mode_outlined:Icons.light_mode_outlined));
            }
          ),
        ],
      ),
    );
  }
}
