import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/app_theme.dart';
import 'pages/add_todo_page.dart';
import 'pages/home_page.dart';

void main() {
  // TODO: setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // 今回右上が被るので
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light, // TODO:SharedPreferencesの保存データを読み込んでここに設定
      locale: null, // TODO:SharedPreferencesの保存データを読み込んでここに設定
      defaultTransition: Transition.noTransition, // Webアプリなのでトランジションなし
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        // 新規作成用
        GetPage(
          name: '/todo',
          page: () => const AddTodoPage(),
        ),
        // 既存更新用
        GetPage(
          name: '/todo/:todoId',
          page: () => AddTodoPage(todoId: Get.parameters['todoId']),
        ),
      ],
    );
  }
}
