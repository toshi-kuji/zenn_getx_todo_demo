import 'package:get/get.dart';

import 'controllers/filter_controller.dart';
import 'controllers/todo_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
    Get.lazyPut(() => FilterController());
  }
}
