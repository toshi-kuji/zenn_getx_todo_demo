import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_demo/controllers/todo_controller.dart';

import '../controllers/filter_controller.dart';
import 'action_button.dart';
import 'todo_tile.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);

  // HomePageでputしたControllerインスタンスを探す
  final todoController = Get.find<TodoController>();
  final filterController = Get.find<FilterController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(
            () {
              final todos = todoController.todos;
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TodoTile(key: Key(todo.id), todo: todo);
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionButton(
                label: 'delete_done'.tr,
                icon: Icons.delete,
                color: Colors.grey,
                onPressed: () {
                  if (!filterController.hideDone) {
                    todoController.deleteDone();
                  }
                },
              ),
              ActionButton(
                label: 'add_new'.tr,
                icon: Icons.add,
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () => Get.toNamed('/todo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
