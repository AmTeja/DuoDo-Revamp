import 'package:duodo/core/domain/entities/todo.dart';

abstract class HomeRepository {
  Stream<List<Todo>> getAllTodos();
  Future<void> updateTodo(Todo todo);
}
