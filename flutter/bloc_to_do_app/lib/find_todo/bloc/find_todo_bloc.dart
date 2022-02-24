import 'package:bloc/bloc.dart';
import 'package:bloc_to_do_app/data/todo_repository.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:equatable/equatable.dart';

part 'find_todo_event.dart';
part 'find_todo_state.dart';

class FindTodoBloc extends Bloc<FindTodoEvent, FindTodoState> {
  final TodoRepository todoRepository = TodoRepository();

  FindTodoBloc() : super(FindTodoInitial()) {
    on<FindTodoEvent>((event, emit) {
      emit(FindTodoLoading());

      if (event is FindOneTodo) {
        try {
          todoRepository.find(event.id);
          emit(FindTodoSuccess(event.id));
        } catch (e) {
          emit(FindTodoFailure(e.toString()));
        }
      }

      if (event is FindAllTodos) {
        try {
          todoRepository.findAll().then(
                (todos) => emit(
                  FindTodosSuccess(todos),
                ),
              );
        } catch (e) {
          emit(FindTodoFailure(e.toString()));
        }
      }
    });
  }
}
