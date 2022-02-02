import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_todo_getx/models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    GetStorage().writeIfNull('todos', []);
    List storedtodos = GetStorage().read<List>('todos') ?? [];
    if (storedtodos.length != 0) {
      todos = storedtodos.map((e) => Todo.formJson(e)).toList().obs;
    }
    ever(todos, (c) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
