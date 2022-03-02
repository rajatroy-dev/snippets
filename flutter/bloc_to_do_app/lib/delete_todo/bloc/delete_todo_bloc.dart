import 'package:bloc/bloc.dart';
import 'package:bloc_to_do_app/data/todo_repository.dart';
import 'package:equatable/equatable.dart';

part 'delete_todo_event.dart';
part 'delete_todo_state.dart';

class DeleteTodoBloc extends Bloc<DeleteTodoEvent, DeleteTodoState> {
  final TodoRepository todoRepository = TodoRepository();

  DeleteTodoBloc() : super(DeleteTodoInitial()) {
    on<DeleteTodoSubmitted>((event, emit) async {
      emit(DeleteTodoLoading());

      try {
        await todoRepository.delete(event.id);
        emit(DeleteTodoSuccess(event.id));
      } catch (e) {
        emit(DeleteTodoFailure(e.toString()));
      }
    });
  }
}
