import 'package:bloc/bloc.dart';
import 'package:bloc_to_do_app/data/todo_repository.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:equatable/equatable.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  final TodoRepository todoRepository = TodoRepository();

  EditTodoBloc() : super(EditTodoInitial()) {
    on<EditTodoSubmitted>((event, emit) async {
      emit(EditTodoLoading());

      try {
        var todo = await todoRepository.findById(event.todo.id ?? '');
        if (todo?.title == '') {
          await todoRepository.insert(event.todo);
        } else {
          await todoRepository.update(event.todo);
        }
        emit(EditTodoSuccess());
      } catch (e) {
        emit(EditTodoFailure(e.toString()));
      }
    });
  }
}
