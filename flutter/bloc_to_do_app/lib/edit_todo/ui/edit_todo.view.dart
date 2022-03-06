import 'package:bloc_to_do_app/common/ui/scaffold.view.dart';
import 'package:bloc_to_do_app/edit_todo/bloc/edit_todo_bloc.dart';
import 'package:bloc_to_do_app/edit_todo/ui/edit_todo_form.view.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTodoView extends StatefulWidget {
  static const routeName = '/add-edit-todo';

  const EditTodoView({Key? key}) : super(key: key);

  @override
  State<EditTodoView> createState() => _EditTodoViewState();
}

class _EditTodoViewState extends State<EditTodoView> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool switchOn = false;
  bool firstLoad = true;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final args = arguments != null ? arguments as Todo : Todo(title: '');
    titleController.text = args.title;
    descriptionController.text = args.description ?? '';

    setState(() {
      if (firstLoad) {
        switchOn = args.completed!;
        firstLoad = false;
      }
    });

    return ScaffoldView(
      body: SingleChildScrollView(
        child: BlocListener<EditTodoBloc, EditTodoState>(
          listener: (context, state) {
            if (state is EditTodoSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Todo added/edited successfully!'),
                ),
              );
              Navigator.of(context).pop();
            }
            if (state is EditTodoFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add/edit todo failed!'),
                ),
              );
            }
          },
          child: EditTodoFormView(
            titleController: titleController,
            descriptionController: descriptionController,
            todo: args,
            switchOn: switchOn,
            handleSwitch: handleSwitch,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleSubmit(context, args),
        tooltip: 'Submit todo',
        child: const Icon(Icons.check),
      ),
    );
  }

  void handleSwitch(bool value) {
    setState(() {
      switchOn = value;
    });
  }

  void handleSubmit(BuildContext context, Todo args) {
    var todo = Todo(
      id: args.id ?? '',
      title: titleController.text,
      description: descriptionController.text,
      completed: switchOn,
    );

    BlocProvider.of<EditTodoBloc>(context).add(EditTodoSubmitted(todo));
  }
}
