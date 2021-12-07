import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:getx_todo_demo/app_middleware.dart';

import 'app_binding.dart';
import 'controllers/locale_controller.dart';
import 'controllers/theme_controller.dart';
import 'data/app_theme.dart';
import 'data/app_translations.dart';
import 'pages/add_todo_page.dart';
import 'pages/home_page.dart';
import 'pages/not_found_page.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  await StorageService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final themeController = Get.put(ThemeController());
  final localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // 今回右上が被るので
      translations: AppTranslations(),
      // storage > device > fallback の優先順
      locale: localeController.getLocale(),
      fallbackLocale: AppTranslations.jaJP,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeController.getThemeMode(),
      defaultTransition: Transition.noTransition, // Webアプリなのでトランジションなし
      initialRoute: '/home',
      initialBinding: AppBinding(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/todo',
          page: () => const AddTodoPage(),
          fullscreenDialog: true,
        ),
        GetPage(
          name: '/todo/:todoId',
          page: () => AddTodoPage(todoId: Get.parameters['todoId']),
          middlewares: [
            AppMiddleware(),
          ],
        ),
      ],
      unknownRoute: GetPage(
        name: '/404',
        page: () => const NotFoundPage(),
      ),
      // onGenerateRoute: (settings) {
      //   return GetPageRoute(
      //     settings: settings,
      //     binding: AppBinding(),
      //     page: () {
      //       final name = settings.name!;
      //       if (name == '/home') {
      //         return HomePage();
      //       }
      //       if (name == '/todo') {
      //         return const AddTodoPage();
      //       }
      //       if (name.startsWith('/todo')) {
      //         final todoId = Uri.splitQueryString(name).values.first;
      //         return AddTodoPage(todoId: todoId);
      //       }
      //       return const NotFoundPage();
      //     },
      //   );
      // },
    );
  }
}
