part of 'view_edit_todo_bloc.dart';

sealed class ViewEditTodoState extends Equatable {
  const ViewEditTodoState();

  @override
  List<Object> get props => [];
}

final class ViewEditTodoInitial extends ViewEditTodoState {}

final class ViewEditTodoLoading extends ViewEditTodoState {}

final class ViewEditTodoLoaded extends ViewEditTodoState {
  final Todo todo;

  const ViewEditTodoLoaded(this.todo);

  @override
  List<Object> get props => [todo];
}

final class ViewEditTodoError extends ViewEditTodoState {
  final String message;

  const ViewEditTodoError(this.message);

  @override
  List<Object> get props => [message];
}

final class ViewEditTodoDeleted extends ViewEditTodoState {}
