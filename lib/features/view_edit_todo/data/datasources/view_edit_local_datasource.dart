import 'package:duodo/core/db/db_item_helpers/todos_helper.dart';
import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/view_edit_todo/data/datasources/view_edit_datasource.dart';

class ViewEditLocalDatasource implements ViewEditDataSource {
  ViewEditLocalDatasource({required this.todosHelper});

  final TodosHelper todosHelper;

  @override
  Future<void> deleteTodoById(int id) {
    return todosHelper.deleteTodoById(id);
  }

  @override
  Future<Todo?> getTodoById(int id) {
    return todosHelper.selectTodoById(id);
  }

  @override
  Future<void> updateTodo(Todo todo) {
    return todosHelper.updateTodo(toTodoItem(todo));
  }
}
