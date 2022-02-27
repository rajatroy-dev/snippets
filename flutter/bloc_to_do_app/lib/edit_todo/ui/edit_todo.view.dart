import 'package:bloc_to_do_app/common/ui/scaffold.view.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: handleSubmit,
        tooltip: 'Submit todo',
        child: const Icon(Icons.check),
      ),
    );
  }

  void handleSubmit() {
    var todo = Todo(
      title: titleController.text,
      description: descriptionController.text,
    );

    print(todo);
  }
}
