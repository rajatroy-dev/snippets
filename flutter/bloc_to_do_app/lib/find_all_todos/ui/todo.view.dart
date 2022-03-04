import 'package:bloc_to_do_app/edit_todo/ui/edit_todo.view.dart';
import 'package:bloc_to_do_app/find_all_todos/cubit/find_all_todos_cubit.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .pushNamed(
            EditTodoView.routeName,
            arguments: todo,
          )
          .then(
            (_) => BlocProvider.of<FindAllTodosCubit>(context).getAllTodos(),
          ),
      title: Text(todo.title),
      subtitle: Text(todo.description ?? ''),
    );
  }
}
