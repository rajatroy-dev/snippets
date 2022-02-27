part of 'edit_todo_bloc.dart';

abstract class EditTodoState extends Equatable {
  const EditTodoState();

  @override
  List<Object> get props => [];
}

class EditTodoInitial extends EditTodoState {}

class EditTodoLoading extends EditTodoState {}

class EditTodoSuccess extends EditTodoState {}

class EditTodoFailure extends EditTodoState {
  final String message;

  const EditTodoFailure(this.message);

  @override
  List<Object> get props => [message];
}
