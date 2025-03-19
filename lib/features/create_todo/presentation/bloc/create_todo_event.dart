part of 'create_todo_bloc.dart';

sealed class CreateTodoEvent extends Equatable {
  const CreateTodoEvent();

  @override
  List<Object> get props => [];
}

class CreateTodoTitleChanged extends CreateTodoEvent {
  const CreateTodoTitleChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

class CreateTodoDescriptionChanged extends CreateTodoEvent {
  const CreateTodoDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class CreateTodoCategoryChanged extends CreateTodoEvent {
  const CreateTodoCategoryChanged(this.category);

  final TodoCategory category;

  @override
  List<Object> get props => [category];
}

class CreateTodoDueDateChanged extends CreateTodoEvent {
  const CreateTodoDueDateChanged(this.dueDate);

  final DateTime dueDate;

  @override
  List<Object> get props => [dueDate];
}

class CreateTodoSubmitted extends CreateTodoEvent {
  const CreateTodoSubmitted();
}
