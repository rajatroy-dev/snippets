import 'package:bloc/bloc.dart';
import 'package:bloc_to_do_app/data/todo_repository.dart';
import 'package:bloc_to_do_app/model/todo.dart';
import 'package:equatable/equatable.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  final TodoRepository todoRepository;

  EditTodoBloc(this.todoRepository) : super(EditTodoInitial()) {
    on<EditTodoEvent>((event, emit) {
      emit(EditTodoLoading());
    });
  }
}