import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required int id,
    required String title,
    required String description,
    required bool isCompleted,
    int? priority,
    TodoCategory? category,
    DateTime? dueDate,
    DateTime? reminderDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

Todo fromTodoItem(TodoItem item) {
  return Todo(
    id: item.id,
    title: item.title,
    description: item.description,
    isCompleted: item.isCompleted,
    createdAt: item.createdAt,
    updatedAt: item.updatedAt,
    priority: item.priority,
    dueDate: item.dueDate,
    reminderDate: item.reminderDate,
  );
}

TodoItem toTodoItem(Todo todo) {
  return TodoItem(
    category: todo.category?.id ?? 0,
    id: todo.id,
    title: todo.title,
    description: todo.description,
    isCompleted: todo.isCompleted,
    createdAt: todo.createdAt,
    updatedAt: todo.updatedAt,
    priority: todo.priority ?? 0,
    dueDate: todo.dueDate,
    reminderDate: todo.reminderDate,
  );
}
