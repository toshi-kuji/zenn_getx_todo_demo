import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_demo/controllers/todo_controller.dart';

class AppMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final controller = Get.find<TodoController>();
    final todoId = Get.parameters['todoId']!; // route!.substring(6)
    final todo = controller.getTodoById(todoId);
    if (todo == null) {
      return const RouteSettings(name: '/home');
    }
  }
}
