import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/db/db_item_helpers/todos_helper.dart';
import 'package:duodo/features/create_todo/data/datasources/create_todo_data_source.dart';

class CreateTodoLocalDataSource implements CreateTodoDataSource {
  CreateTodoLocalDataSource(this._todosHelper);

  final TodosHelper _todosHelper;

  @override
  Future<void> create(TodosCompanion todo) async {
    await _todosHelper.insertTodo(todo);
  }
}
