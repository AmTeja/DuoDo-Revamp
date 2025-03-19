import 'package:duodo/core/db/database.dart';

abstract class CategoriesDataSource {
  Stream<List<CategoryItem>> getCategories();
  Future<void> addCategory(CategoryItem category);
}
