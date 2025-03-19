import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/view_edit_todo/domain/repositories/view_edit_todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_edit_todo_event.dart';
part 'view_edit_todo_state.dart';

class ViewEditTodoBloc extends Bloc<ViewEditTodoEvent, ViewEditTodoState> {
  ViewEditTodoBloc({
    required ViewEditTodoRepository viewEditTodoRepository,
    required this.todoId,
  })  : _viewEditTodoRepository = viewEditTodoRepository,
        super(ViewEditTodoInitial()) {
    on<LoadTodoForView>(_onLoadTodoForView);
    on<TodoLoadedForView>(_onViewTodoLoaded);
    on<EditUpdateTodo>(_onTodoUpdated);
    on<EditDeleteTodo>(_onTodoDeleted);

    add(LoadTodoForView(todoId));
  }

  final ViewEditTodoRepository _viewEditTodoRepository;
  final int todoId;

  void _onLoadTodoForView(
    LoadTodoForView event,
    Emitter<ViewEditTodoState> emit,
  ) async {
    final todo = await _viewEditTodoRepository.getTodoById(id: event.todoId);

    if (todo == null) {
      emit(const ViewEditTodoError('Todo not found'));
    } else {
      add(TodoLoadedForView(todo));
    }
  }

  void _onViewTodoLoaded(
    TodoLoadedForView event,
    Emitter<ViewEditTodoState> emit,
  ) {
    emit(ViewEditTodoLoaded(event.todo));
  }

  void _onTodoUpdated(
    EditUpdateTodo event,
    Emitter<ViewEditTodoState> emit,
  ) async {
    await _viewEditTodoRepository.updateTodo(todo: event.todo);

    add(LoadTodoForView(event.todo.id));
  }

  void _onTodoDeleted(
    EditDeleteTodo event,
    Emitter<ViewEditTodoState> emit,
  ) async {
    await _viewEditTodoRepository.deleteTodoById(id: event.todoId);

    emit(ViewEditTodoDeleted());
  }
}
