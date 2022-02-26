import 'package:bloc/bloc.dart';
import 'package:bloc_to_do_app/data/todo_repository.dart';
import 'package:equatable/equatable.dart';

part 'find_todo_event.dart';
part 'find_todo_state.dart';

class FindTodoBloc extends Bloc<FindTodoEvent, FindTodoState> {
  final TodoRepository todoRepository = TodoRepository();

  FindTodoBloc() : super(FindTodoInitial()) {
    on<FindTodo>((event, emit) {
      emit(FindTodoLoading());
      try {
        todoRepository.find(event.id);
        emit(FindTodoSuccess(event.id));
      } catch (e) {
        emit(FindTodoFailure(e.toString()));
      }
    });
  }
}
