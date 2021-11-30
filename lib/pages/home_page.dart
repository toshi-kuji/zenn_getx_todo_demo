import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_demo/controllers/todo_controller.dart';
import 'package:getx_todo_demo/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // TodoControllerインスタンスをシングルトンとして現在のRouteに登録
  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('タイトル（仮）'), // TODO:未完了タスクの数を表示
        leading: IconButton(
          icon: const Icon(Icons.filter_alt_outlined), // TODO:フィルタ有無の状態をアイコンに反映
          onPressed: () {}, // TODO:フィルタの処理を呼び出す
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {}, // TODO:ロケール変更の処理を呼び出す
          ),
          IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () {} // TODO:テーマ変更の処理を呼び出す
              ),
        ],
      ),
      body: TodoList(),
    );
  }
}
