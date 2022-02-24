import '../model/todo.dart';

class TodoDao {
  var todos = <Todo>[
    Todo(title: '1', description: '1', completed: false),
    Todo(title: '2', description: '2', completed: false),
    Todo(title: '3', description: '3', completed: false),
  ];
  Todo? tempTodo;

  Future<String> insert(Todo todo) async {
    todos.add(todo);

    return todo.id as String;
  }

  Future<String> update(Todo todo) async {
    for (var item in todos) {
      if (item.id == todo.id) {
        item = todo;
      }
    }

    return todo.id as String;
  }

  Future<String> delete(String id) async {
    todos.removeWhere((element) => element.id == id);

    return id;
  }

  Future<Todo> find(String id) async {
    Todo todo = todos.singleWhere((element) => element.id == id);

    return todo;
  }

  Future<List<Todo>> findAll() async {
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
