import 'package:bloc_to_do_app/data/todo_dao.dart';
import 'package:bloc_to_do_app/model/todo.dart';

class TodoRepository {
  final _dao = TodoDao();

  Future<String?> insert(Todo todo) => _dao.insert(todo);
  Future<String?> update(Todo todo) => _dao.update(todo);
}
