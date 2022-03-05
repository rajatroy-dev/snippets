import 'package:bloc_to_do_app/edit_todo/bloc/edit_todo_bloc.dart';
import 'package:bloc_to_do_app/edit_todo/ui/edit_todo.view.dart';
import 'package:bloc_to_do_app/find_all_todos/cubit/find_all_todos_cubit.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  bool todoCompleted = false;
  Todo _todo = Todo(title: '');

  @override
  void initState() {
    setState(() {
      todoCompleted = widget.todo.completed as bool;
      _todo = widget.todo;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todoCompleted,
        onChanged: (value) => handleCheckbox(context, value),
      ),
      onTap: () => Navigator.of(context)
          .pushNamed(
            EditTodoView.routeName,
            arguments: _todo,
          )
          .then(
            (_) => BlocProvider.of<FindAllTodosCubit>(context).getAllTodos(),
          ),
      title: Text(
        _todo.title,
        style: todoCompleted
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      subtitle: Text(
        _todo.description ?? '',
        style: todoCompleted
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
    );
  }

  void handleCheckbox(BuildContext context, bool? value) {
    var todo = Todo(
      id: _todo.id,
      title: _todo.title,
      description: _todo.description,
      completed: value as bool,
    );

    setState(() {
      todoCompleted = value;
      _todo = todo;
    });

    BlocProvider.of<EditTodoBloc>(context).add(EditTodoSubmitted(todo));
  }
}
