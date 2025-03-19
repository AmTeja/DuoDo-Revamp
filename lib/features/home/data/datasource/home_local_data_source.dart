import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/db/db_item_helpers/todos_helper.dart';
import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/home/data/datasource/home_data_source.dart';

class HomeLocalDataSource implements HomeDataSource {
  const HomeLocalDataSource(this._todosHelper);

  final TodosHelper _todosHelper;

  @override
  Stream<List<Todo>> getAllTodos() {
    return _todosHelper.selectTodos();
  }

  @override
  Future<void> updateTodo(TodoItem todo) async {
    await _todosHelper.updateTodo(todo);
  }
}
