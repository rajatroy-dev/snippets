part of 'delete_todo_bloc.dart';

abstract class DeleteTodoState extends Equatable {
  const DeleteTodoState();

  @override
  List<Object> get props => [];
}

class DeleteTodoInitial extends DeleteTodoState {}

class DeleteTodoLoading extends DeleteTodoState {}

class DeleteTodoSuccess extends DeleteTodoState {
  final String id;

  const DeleteTodoSuccess(this.id);

  @override
  List<Object> get props => [id];
}

class DeleteTodoFailure extends DeleteTodoState {
  final String message;

  const DeleteTodoFailure(this.message);

  @override
  List<Object> get props => [message];
}
