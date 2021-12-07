import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_demo/controllers/todo_controller.dart';
import 'package:getx_todo_demo/widgets/todo_list.dart';

import '../controllers/filter_controller.dart';
import '../controllers/locale_controller.dart';
import '../controllers/theme_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final todoController = Get.find<TodoController>();
  final filterController = Get.find<FilterController>();
  final localeController = Get.find<LocaleController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text('title'.tr + ' (${todoController.countUndone})'),
        ),
        leading: IconButton(
          icon: Obx(() => Icon(
                filterController.hideDone
                    ? Icons.filter_alt
                    : Icons.filter_alt_outlined,
              )),
          onPressed: filterController.toggleHide,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: localeController.changeLocale,
          ),
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: themeController.changeTheme,
          ),
        ],
      ),
      body: TodoList(),
    );
  }
}
