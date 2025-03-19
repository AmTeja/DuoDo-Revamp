import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/view_edit_todo/data/datasources/view_edit_datasource.dart';
import 'package:duodo/features/view_edit_todo/domain/repositories/view_edit_todo_repository.dart';

class ViewEditTodoRepositoryImpl implements ViewEditTodoRepository {
  const ViewEditTodoRepositoryImpl({required this.viewEditDataSource});

  final ViewEditDataSource viewEditDataSource;

  @override
  Future<void> deleteTodoById({required int id}) {
    return viewEditDataSource.deleteTodoById(id);
  }

  @override
  Future<void> updateTodo({required Todo todo}) {
    return viewEditDataSource.updateTodo(todo);
  }

  @override
  Future<Todo?> getTodoById({required int id}) {
    return viewEditDataSource.getTodoById(id);
  }
}
