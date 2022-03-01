import 'package:hive_flutter/hive_flutter.dart';

import '../model/todo.dart';

class TodoDao {
  final Box _box = Hive.box<Todo>('todoBox');

  Todo? tempTodo;

  Future<String> insert(Todo todo) async {
    await _box.put(todo.id, todo);

    return todo.id as String;
  }

  Future<String> update(Todo todo) async {
    await _box.put(todo.id, todo);

    return todo.id as String;
  }

  Future<String> delete(String id) async {
    await _box.delete(id);

    return id;
  }

  Future<Todo?> findById(String id) async {
    Todo? todo = await _box.get(id);

    return todo;
  }

  Future<List<Todo>> findAll() async {
    var todos = _box.values.toList() as List<Todo>;
    return todos;
  }

  Future<void> pushTodoToEditScreen(Todo todo) async {
    tempTodo = todo;
  }

  Future<Todo> popTodoForEditScreen() async {
    Todo todo = tempTodo as Todo;
    tempTodo = null as Todo;
    return todo;
  }
}

class TodoException implements Exception {}
