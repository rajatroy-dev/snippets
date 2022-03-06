import 'package:bloc_to_do_app/model/todo.dart';
import 'package:flutter/material.dart';

class EditTodoFormView extends StatelessWidget {
  EditTodoFormView({
    Key? key,
    required this.titleController,
    required this.descriptionController,
    required this.todo,
    required this.switchOn,
    required this.handleSwitch,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final Todo todo;
  final bool switchOn;
  final Function(bool) handleSwitch;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
            todo.title.isNotEmpty
                ? Padding(
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
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
