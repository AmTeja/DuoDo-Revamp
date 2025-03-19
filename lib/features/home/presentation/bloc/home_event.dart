part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadTodos extends HomeEvent {
  const HomeLoadTodos();
}

class HomeTodosLoaded extends HomeEvent {
  const HomeTodosLoaded(this.todos);

  final List<Todo> todos;

  @override
  List<Object> get props => [todos];
}

class HomeTodoUpdated extends HomeEvent {
  const HomeTodoUpdated(this.todo);

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class HomeDayChanged extends HomeEvent {
  const HomeDayChanged(this.day);

  final DateTime day;

  @override
  List<Object> get props => [day];
}
