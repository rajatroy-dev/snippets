part of 'find_todo_bloc.dart';

abstract class FindTodoEvent extends Equatable {
  const FindTodoEvent();

  @override
  List<Object> get props => [];
}

class FindTodo extends FindTodoEvent {
  final String id;

  const FindTodo(this.id);

  @override
  List<Object> get props => [id];
}
