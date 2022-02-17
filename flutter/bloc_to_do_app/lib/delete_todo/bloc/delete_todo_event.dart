part of 'delete_todo_bloc.dart';

abstract class DeleteTodoEvent extends Equatable {
  const DeleteTodoEvent();

  @override
  List<Object> get props => [];
}

class DeleteTodoSubmitted extends DeleteTodoEvent {
  final String id;

  const DeleteTodoSubmitted(this.id);

  @override
  List<Object> get props => [id];
}
