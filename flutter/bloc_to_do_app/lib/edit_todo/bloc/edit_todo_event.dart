part of 'edit_todo_bloc.dart';

abstract class EditTodoEvent extends Equatable {
  const EditTodoEvent();

  @override
  List<Object> get props => [];
}

class EditTodoSubmitted extends EditTodoEvent {
  final Todo todo;

  const EditTodoSubmitted(this.todo);

  @override
  List<Object> get props => [todo];
}
