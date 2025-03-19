part of 'home_bloc.dart';

enum HomeStateStatus { initial, loading, loaded, error }

final class HomeState extends Equatable {
  const HomeState({
    required this.selectedDay,
    this.todos = const <Todo>[],
    this.status = HomeStateStatus.initial,
  });

  final List<Todo> todos;
  final DateTime selectedDay;

  final HomeStateStatus status;

  List<Todo> get todosForSelectedDay {
    return todos.where((todo) {
      return todo.createdAt.year == selectedDay.year &&
          todo.createdAt.month == selectedDay.month &&
          todo.createdAt.day == selectedDay.day;
    }).toList();
  }

  // Copy with
  HomeState copyWith({
    List<Todo>? todos,
    HomeStateStatus? status,
    DateTime? selectedDay,
  }) {
    return HomeState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }

  @override
  List<Object> get props => [todos, status, selectedDay];
}
