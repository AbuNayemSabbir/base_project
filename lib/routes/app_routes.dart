import 'package:get/get.dart';
import 'package:flutter_base_project/view/home_page.dart';
import 'package:flutter_base_project/view/home_page_details.dart';
import 'package:flutter_base_project/view/main_page.dart';
import 'package:flutter_base_project/view/profile_page.dart';
import 'package:flutter_base_project/view/profile_page_details.dart';
import 'package:flutter_base_project/view/settings_page.dart';
import 'package:flutter_base_project/view/settings_page_details.dart';

class AppRoutes {
  static const String home = '/home';
  static const String homeDetail = '/home/detail';
  static const String settings = '/settings';
  static const String settingsDetail = '/settings/detail';
  static const String profile = '/profile';
  static const String profileDetail = '/profile/detail';

  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => MainPage()),
    GetPage(name: home, page: () =>  const HomeScreen()),
    GetPage(name: homeDetail, page: () => const HomeDetailScreen()),
    GetPage(name: settings, page: () => const SettingsScreen()),
    GetPage(name: settingsDetail, page: () => const SettingsDetailScreen()),
    GetPage(name: profile, page: () =>  ProfileScreen()),
    GetPage(name: profileDetail, page: () => const ProfileDetailScreen()),
  ];
}