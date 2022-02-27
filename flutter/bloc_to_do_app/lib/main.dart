import 'package:bloc_to_do_app/common/ui/scaffold.view.dart';
import 'package:bloc_to_do_app/edit_todo/ui/edit_todo.view.dart';
import 'package:bloc_to_do_app/find_all_todos/cubit/find_all_todos_cubit.dart';
import 'package:bloc_to_do_app/find_all_todos/ui/show_all_todos.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FindAllTodosCubit()),
        ],
        child: const MyHomePage(),
      ),
      routes: {
        EditTodoView.routeName: (context) => EditTodoView(),
      },
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
    return ScaffoldView(
      body: const ShowAllTodos(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(EditTodoView.routeName),
        tooltip: 'Add todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
