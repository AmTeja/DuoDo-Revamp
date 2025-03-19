import 'package:duodo/core/domain/entities/todo.dart';

abstract class ViewEditDataSource {
  Future<Todo?> getTodoById(int id);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodoById(int id);
}
