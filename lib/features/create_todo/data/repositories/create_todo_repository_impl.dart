import 'package:duodo/core/db/database.dart';
import 'package:duodo/features/create_todo/data/datasources/create_todo_data_source.dart';
import 'package:duodo/features/create_todo/domain/repository/create_todo_repository.dart';

class CreateTodoRepositoryImpl implements CreateTodoRepository {
  const CreateTodoRepositoryImpl(this._createTodoDataSource);

  final CreateTodoDataSource _createTodoDataSource;

  @override
  Future<void> createTodo(TodosCompanion todo) async {
    await _createTodoDataSource.create(todo);
  }
}
