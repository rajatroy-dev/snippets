import 'package:bloc_to_do_app/find_todo/bloc/find_todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllTodos extends StatefulWidget {
  const ShowAllTodos({Key? key}) : super(key: key);

  @override
  State<ShowAllTodos> createState() => _ShowAllTodosState();
}

class _ShowAllTodosState extends State<ShowAllTodos> {
  final findTodoBloc = FindTodoBloc();

  @override
  void initState() {
    final provider = BlocProvider.of<FindTodoBloc>(context);
    provider.add(FindAllTodos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: findTodoBloc,
      builder: (BuildContext context, FindTodoState state) {
        if (state is FindTodoInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FindTodoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FindTodosSuccess) {
          return Text(state.props.length as String);
        } else if (state is FindTodoFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text('Something Went Wrong!'),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    findTodoBloc.close();
    super.dispose();
  }
}
