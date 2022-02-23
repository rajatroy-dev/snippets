part of 'find_todo_bloc.dart';

abstract class FindTodoEvent extends Equatable {
  const FindTodoEvent();

  @override
  List<Object> get props => [];
}

class FindAllTodos extends FindTodoEvent {}

class FindOneTodo extends FindTodoEvent {
  final String id;

  const FindOneTodo(this.id);

  @override
  List<Object> get props => [id];
}
