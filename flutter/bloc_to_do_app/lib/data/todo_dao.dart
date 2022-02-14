import '../model/todo.dart';

class TodoDao {
  var todos = <Todo>[];

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
