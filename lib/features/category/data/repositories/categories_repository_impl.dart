import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/features/category/data/datasources/categories_data_source.dart';
import 'package:duodo/features/category/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  const CategoriesRepositoryImpl({required this.dataSource});

  final CategoriesDataSource dataSource;

  @override
  Future<void> addCategory(TodoCategory category) async {
    return dataSource.addCategory(categoryItemFromTodoCategory(category));
  }

  @override
  Stream<List<TodoCategory>> getCategories() {
    return dataSource
        .getCategories()
        .map((e) => e.map(todoCategoryfromCategoryItem).toList());
  }
}
