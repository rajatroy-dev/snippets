import '../model/todo.dart';

class TodoDao {
  var todos = <Todo>[];

  Future<String?> insert(Todo todo) async {
    todos.add(todo);

    return todo.id;
  }

  Future<String?> update(Todo todo) async {
    for (var item in todos) {
      if (item.id == todo.id) {
        item = todo;
      }
    }

    return todo.id;
  }
}

class TodoException implements Exception {}
