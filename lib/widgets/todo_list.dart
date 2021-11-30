import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_demo/controllers/todo_controller.dart';

import 'action_button.dart';
import 'todo_tile.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);

  // HomePageでputしたControllerインスタンスを探す
  final todoController = Get.find<TodoController>();

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
                  return TodoTile(todo: todo);
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionButton(
                label: '完了削除',
                icon: Icons.delete,
                color: Colors.grey,
                onPressed: () {
                  // TODO: フィルタが解除されていて、一つでも完了タスクがある場合のみ動作させる
                  // TODO: 削除確認用のバナーを表示させる
                  todoController.deleteDone();
                },
              ),
              ActionButton(
                label: '新規作成',
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
