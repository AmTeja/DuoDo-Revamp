import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/domain/entities/todo.dart';

abstract class HomeDataSource {
  Stream<List<Todo>> getAllTodos();
  Future<void> updateTodo(TodoItem todo);
}
