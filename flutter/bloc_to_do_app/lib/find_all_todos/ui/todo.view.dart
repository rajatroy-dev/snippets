import 'package:bloc_to_do_app/delete_todo/bloc/delete_todo_bloc.dart';
import 'package:bloc_to_do_app/find_all_todos/cubit/find_all_todos_cubit.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          BlocProvider.of<DeleteTodoBloc>(context).add(
            DeleteTodoSubmitted(todo.id as String),
          );
          await BlocProvider.of<FindAllTodosCubit>(context).getAllTodos();
        }
      },
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.description ?? ''),
      ),
    );
  }
}
