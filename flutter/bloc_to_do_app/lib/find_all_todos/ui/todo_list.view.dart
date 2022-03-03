import 'package:bloc_to_do_app/delete_todo/bloc/delete_todo_bloc.dart';
import 'package:bloc_to_do_app/find_all_todos/ui/todo.view.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    var todosCopy = widget.todos;

    return BlocListener<DeleteTodoBloc, DeleteTodoState>(
      listener: (context, state) {
        if (state is DeleteTodoSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Todo deleted successfully!'),
            ),
          );
        }
        if (state is DeleteTodoFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Delete todo failed!'),
            ),
          );
          setState(() {
            todosCopy = widget.todos;
          });
        }
      },
      child: ListView.builder(
        itemCount: todosCopy.length,
        itemBuilder: (_, index) {
          final todo = todosCopy[index];

          return Dismissible(
            key: Key(todo.id as String),
            child: TodoWidget(todo: todo),
            onDismissed: (direction) {
              BlocProvider.of<DeleteTodoBloc>(context).add(
                DeleteTodoSubmitted(todo.id as String),
              );

              setState(() {
                todosCopy.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
