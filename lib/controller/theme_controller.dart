import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  ThemeController() {
    // Load the theme preference when the controller is created
    isDarkMode.value = _loadThemeFromStorage();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  bool _loadThemeFromStorage() => _storage.read(_key) ?? false;

  void _saveThemeToStorage(bool isDarkMode) => _storage.write(_key, isDarkMode);

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToStorage(isDarkMode.value);
  }
}
