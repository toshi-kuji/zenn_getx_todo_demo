import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_demo/controllers/todo_controller.dart';
import 'package:getx_todo_demo/models/todo.dart';
import 'package:getx_todo_demo/widgets/action_button.dart';

class AddTodoPage extends StatefulWidget {
  final String? todoId;

  const AddTodoPage({Key? key, this.todoId}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoController = Get.find<TodoController>();
  final textController = TextEditingController();
  Todo? todo;

  @override
  void initState() {
    super.initState();
    // 既存更新の場合（新規作成は以下無視）
    if (widget.todoId != null) {
      // 該当タスクを探してtodoに代入
      todo = todoController.getTodoById(widget.todoId!);
      if (todo != null) {
        // TextFieldにdescription表示
        textController.text = todo!.description;
      } else {
        // TODO: 該当するタスクがない場合はHomePageへ
      }
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 既存編集ならID、新規作成なら「新規タスク」と表示
        title: Text('id: ${(todo?.id ?? '新規タスク')}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                TextField(
                  controller: textController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'タスク入力',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 25),
                  maxLines: null, // 行数に制限なし
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  label: 'キャンセル',
                  icon: Icons.cancel,
                  color: Colors.grey,
                  onPressed: () {
                    // TODO:ブラウザから直接アクセスした場合に対応
                    Get.back();
                  },
                ),
                ActionButton(
                  label: todo == null ? '追加' : '更新',
                  icon: Icons.check,
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    final text = textController.text;
                    if (todo == null && text.isNotEmpty) {
                      todoController.addTodo(text); // 新規追加
                    } else if (todo != null) {
                      todoController.updateText(text, todo!); // 既存更新
                    }
                    // TODO:ブラウザから直接アクセスした場合に対応
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
