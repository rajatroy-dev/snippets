import 'package:bloc_to_do_app/common/ui/scaffold.view.dart';
import 'package:bloc_to_do_app/edit_todo/bloc/edit_todo_bloc.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTodoView extends StatelessWidget {
  static const routeName = '/add-edit-todo';

  EditTodoView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleSubmit(context),
        tooltip: 'Submit todo',
        child: const Icon(Icons.check),
      ),
    );
  }

  void handleSubmit(BuildContext context) {
    var todo = Todo(
      title: titleController.text,
      description: descriptionController.text,
    );

    BlocProvider.of<EditTodoBloc>(context).add(EditTodoSubmitted(todo));
  }
}
