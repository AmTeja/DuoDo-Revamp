import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/home/data/datasource/home_data_source.dart';
import 'package:duodo/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._homeDataSource);

  final HomeDataSource _homeDataSource;

  @override
  Stream<List<Todo>> getAllTodos() {
    return _homeDataSource.getAllTodos();
  }

  @override
  Future<void> updateTodo(Todo todo) {
    return _homeDataSource.updateTodo(toTodoItem(todo));
  }
}
