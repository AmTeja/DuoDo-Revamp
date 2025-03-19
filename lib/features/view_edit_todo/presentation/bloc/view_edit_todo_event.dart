part of 'view_edit_todo_bloc.dart';

sealed class ViewEditTodoEvent extends Equatable {
  const ViewEditTodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodoForView extends ViewEditTodoEvent {
  final int todoId;

  const LoadTodoForView(this.todoId);

  @override
  List<Object> get props => [todoId];
}

class TodoLoadedForView extends ViewEditTodoEvent {
  final Todo todo;

  const TodoLoadedForView(this.todo);

  @override
  List<Object> get props => [todo];
}

class EditUpdateTodo extends ViewEditTodoEvent {
  final Todo todo;

  const EditUpdateTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class EditDeleteTodo extends ViewEditTodoEvent {
  final int todoId;

  const EditDeleteTodo(this.todoId);

  @override
  List<Object> get props => [todoId];
}
