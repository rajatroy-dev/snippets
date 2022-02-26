part of 'find_todo_bloc.dart';

abstract class FindTodoState extends Equatable {
  const FindTodoState();

  @override
  List<Object> get props => [];
}

class FindTodoInitial extends FindTodoState {}

class FindTodoLoading extends FindTodoState {}

class FindTodoSuccess extends FindTodoState {
  final String id;

  const FindTodoSuccess(this.id);

  @override
  List<Object> get props => [id];
}

class FindTodoFailure extends FindTodoState {
  final String message;

  const FindTodoFailure(this.message);

  @override
  List<Object> get props => [message];
}
