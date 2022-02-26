import 'package:bloc/bloc.dart';
import 'package:bloc_to_do_app/data/todo_repository.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:equatable/equatable.dart';

part 'find_all_todos_state.dart';

class FindAllTodosCubit extends Cubit<FindAllTodosState> {
  final TodoRepository todoRepository = TodoRepository();

  FindAllTodosCubit() : super(FindAllTodosInitial());

  Future<void> getAllTodos() async {
    emit(FindAllTodosLoading());
    try {
      var todos = await todoRepository.findAll();
      emit(FindAllTodosSuccess(todos));
    } catch (e) {
      emit(FindAllTodosFailure(e.toString()));
    }
  }
}
