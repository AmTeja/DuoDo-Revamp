import 'package:duodo/core/domain/entities/category.dart';

abstract class CategoriesRepository {
  Stream<List<TodoCategory>> getCategories();
  Future<void> addCategory(TodoCategory category);
}
