import 'package:bloc_to_do_app/common/ui/scaffold.view.dart';
import 'package:bloc_to_do_app/edit_todo/ui/edit_todo.view.dart';
import 'package:bloc_to_do_app/find_all_todos/cubit/find_all_todos_cubit.dart';
import 'package:bloc_to_do_app/find_all_todos/ui/todo_list.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllTodos extends StatefulWidget {
  const ShowAllTodos({Key? key}) : super(key: key);

  @override
  State<ShowAllTodos> createState() => _ShowAllTodosState();
}

class _ShowAllTodosState extends State<ShowAllTodos> {
  final cubit = FindAllTodosCubit();

  @override
  void initState() {
    BlocProvider.of<FindAllTodosCubit>(context).getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldView(
      body: BlocBuilder<FindAllTodosCubit, FindAllTodosState>(
        builder: (BuildContext context, FindAllTodosState state) {
          if (state is FindAllTodosInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FindAllTodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FindAllTodosSuccess) {
            return state.todos.isNotEmpty
                ? TodoList(todos: state.todos)
                : const Center(child: Text('There is nothing to do!'));
          } else if (state is FindAllTodosFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Something Went Wrong!'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamed(
              EditTodoView.routeName,
            )
            .then(
              (_) => BlocProvider.of<FindAllTodosCubit>(context).getAllTodos(),
            ),
        tooltip: 'Add todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
