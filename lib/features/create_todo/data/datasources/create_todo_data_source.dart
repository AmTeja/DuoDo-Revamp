import 'package:duodo/core/db/database.dart';

abstract class CreateTodoDataSource {
  Future<void> create(TodosCompanion todo);
}
