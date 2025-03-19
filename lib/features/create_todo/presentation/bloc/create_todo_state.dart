part of 'create_todo_bloc.dart';

enum CreateTodoStatus { initial, submitting, success, error }

final class CreateTodoState extends Equatable {
  const CreateTodoState({
    this.title = '',
    this.description = '',
    this.status = CreateTodoStatus.initial,
    this.category,
    this.dueDate,
    this.failureMessage,
  });

  //Fields
  final String title;
  final String description;
  final TodoCategory? category;
  final DateTime? dueDate;

  //State
  final CreateTodoStatus status;
  final String? failureMessage;

  CreateTodoState copyWith({
    String? title,
    String? description,
    TodoCategory? category,
    DateTime? dueDate,
    CreateTodoStatus? status,
    Wrapped<String?>? failureMessage,
  }) {
    return CreateTodoState(
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      failureMessage:
          failureMessage != null ? failureMessage.value : this.failureMessage,
    );
  }

  @override
  List<Object?> get props =>
      [title, description, category, dueDate, status, failureMessage];
}
