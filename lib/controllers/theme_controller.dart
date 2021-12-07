import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/storage_service.dart';

class ThemeController extends GetxController {
  final _storage = ThemeStorage();

  ThemeMode getThemeMode() {
    final isDark = _storage.load();
    if (isDark != null) {
      return isDark ? ThemeMode.dark : ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  void changeTheme() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    _storage.save(!Get.isDarkMode);
  }
}
