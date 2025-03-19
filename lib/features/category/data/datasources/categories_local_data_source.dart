import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/db/db_item_helpers/categories_helper.dart';
import 'package:duodo/features/category/data/datasources/categories_data_source.dart';

class CategoriesLocalDataSource implements CategoriesDataSource {
  const CategoriesLocalDataSource({required this.categoriesHelper});

  final CategoriesHelper categoriesHelper;

  @override
  Stream<List<CategoryItem>> getCategories() {
    return categoriesHelper.selectCategories();
  }

  @override
  Future<void> addCategory(CategoryItem category) {
    return categoriesHelper.insertCategory(category);
  }
}
