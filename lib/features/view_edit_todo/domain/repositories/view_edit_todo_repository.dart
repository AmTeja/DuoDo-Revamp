import 'package:duodo/core/domain/entities/todo.dart';

abstract class ViewEditTodoRepository {
  Future<void> updateTodo({required Todo todo});
  Future<void> deleteTodoById({required int id});
  Future<Todo?> getTodoById({required int id});
}
