part of 'find_all_todos_cubit.dart';

abstract class FindAllTodosState extends Equatable {
  const FindAllTodosState();

  @override
  List<Object> get props => [];
}

class FindAllTodosInitial extends FindAllTodosState {}

class FindAllTodosLoading extends FindAllTodosState {}

class FindAllTodosSuccess extends FindAllTodosState {
  final List<Todo> todos;

  const FindAllTodosSuccess(this.todos);

  @override
  List<Object> get props => [todos];
}

class FindAllTodosFailure extends FindAllTodosState {
  final String message;

  const FindAllTodosFailure(this.message);

  @override
  List<Object> get props => [message];
}
