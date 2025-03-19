import 'package:duodo/core/db/database.dart';

abstract class CreateTodoRepository {
  Future<void> createTodo(TodosCompanion todo);
}
