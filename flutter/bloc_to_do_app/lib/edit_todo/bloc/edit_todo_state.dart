part of 'edit_todo_bloc.dart';

abstract class EditTodoState extends Equatable {
  const EditTodoState();

  @override
  List<Object> get props => [];
}

class EditTodoInitial extends EditTodoState {}

class EditTodoLoading extends EditTodoState {}

class EditTodoSuccess extends EditTodoState {
  final Todo todo;

  const EditTodoSuccess(this.todo);

  @override
  List<Object> get props => [todo];
}

class EditTodoFailure extends EditTodoState {
  final String message;

  const EditTodoFailure(this.message);

  @override
  List<Object> get props => [message];
}
