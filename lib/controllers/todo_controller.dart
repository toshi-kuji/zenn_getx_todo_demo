import 'package:get/get.dart';
import 'package:getx_todo_demo/models/todo.dart';

class TodoController extends GetxController {
  final _todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _todos.addAll(Todo.initialTodos);
  }

  List<Todo> get todos => _todos; // TODO:フィルタの状態によって返すTodoを変える

  // IDからTodoを取得
  Todo? getTodoById(String id) {
    try {
      return _todos.singleWhere((e) => e.id == id);
    } on StateError {
      return null; // 該当IDがなければnullを返す
    }
  }

  // Todo新規作成
  void addTodo(String description) {
    final todo = Todo(description: description);
    _todos.add(todo);
  }

  // Todoのテキスト更新
  void updateText(String description, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copyWith(description: description);
    _todos.setAll(index, [newTodo]);
  }

  // Todoの完了状況更新
  void updateDone(bool done, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copyWith(done: done);
    _todos.setAll(index, [newTodo]);
  }

  // 指定タスクを削除
  void remove(Todo todo) {
    _todos.remove(todo); // 等価性overrideしたのでOK
  }

  // 完了タスクを一括削除
  void deleteDone() {
    _todos.removeWhere((e) => e.done == true);
  }
}
