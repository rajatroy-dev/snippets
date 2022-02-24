import 'package:bloc_to_do_app/find_todo/ui/todo.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, index) {
        final todo = todos[index];

        return TodoWidget(todo: todo);
      },
    );
  }
}
