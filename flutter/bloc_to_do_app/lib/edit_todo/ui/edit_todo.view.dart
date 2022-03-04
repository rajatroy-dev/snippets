import 'package:bloc_to_do_app/common/ui/scaffold.view.dart';
import 'package:bloc_to_do_app/edit_todo/bloc/edit_todo_bloc.dart';
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
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool switchOn = false;
  bool firstLoad = true;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final args = arguments != null ? arguments as Todo : Todo(title: '');
    titleController.text = args.title.isNotEmpty ? args.title : '';
    descriptionController.text = args.description ?? '';

    setState(() {
      if (firstLoad) {
        switchOn = args.completed ?? switchOn;
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
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.check),
                      hintText: 'What would you like to do?',
                      labelText: 'Title',
                    ),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.notes_rounded),
                      hintText: 'Describe to do . . .',
                      labelText: 'Description',
                      alignLabelWithHint: true,
                    ),
                    maxLines: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 40.0,
                      right: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Completed'),
                        Switch(
                          value: switchOn,
                          onChanged: handleSwitch,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
