import 'package:bloc_to_do_app/edit_todo/bloc/edit_todo_bloc.dart';
import 'package:bloc_to_do_app/edit_todo/ui/edit_todo.view.dart';
import 'package:bloc_to_do_app/find_all_todos/cubit/find_all_todos_cubit.dart';
import 'package:bloc_to_do_app/find_all_todos/ui/show_all_todos.view.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'delete_todo/bloc/delete_todo_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FindAllTodosCubit()),
        BlocProvider(create: (context) => EditTodoBloc()),
        BlocProvider(create: (context) => DeleteTodoBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        routes: {
          EditTodoView.routeName: (context) => const EditTodoView(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const ShowAllTodos();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
