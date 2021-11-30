import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_demo/controllers/todo_controller.dart';
import 'package:getx_todo_demo/models/todo.dart';

class TodoCheckbox extends StatelessWidget {
  final Todo todo;

  const TodoCheckbox(this.todo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      // チェックボックスが小さい対策
      scale: 1.5,
      child: Checkbox(
        shape: const CircleBorder(),
        checkColor: Colors.transparent,
        activeColor: Colors.grey,
        side: BorderSide(
          width: 3,
          color: Theme.of(context).colorScheme.primary,
        ),
        value: todo.done,
        onChanged: (value) {
          // チェックボックスが押されたらTodoControllerを探してTodoを差し替え
          Get.find<TodoController>().updateDone(value!, todo);
        },
      ),
    );
  }
}
