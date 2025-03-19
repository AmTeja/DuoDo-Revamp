import 'package:drift/drift.dart';
import 'package:duodo/core/db/database.dart';

class CategoriesHelper {
  const CategoriesHelper(this.categoriesTable);

  final $CategoriesTable categoriesTable;

  Stream<List<CategoryItem>> selectCategories() async* {
    yield* categoriesTable.select().watch();
  }

  Future<void> insertCategory(CategoryItem category) async {
    await categoriesTable.insertOne(
      CategoriesCompanion.insert(
        name: category.name,
        icon: category.icon,
        color: Value(category.color),
        updatedAt: category.updatedAt,
        createdAt: category.createdAt,
      ),
    );
  }

  Future<void> updateCategory(CategoryItem category) async {
    (categoriesTable.update()..where((item) => item.id.equals(category.id)))
        .write(
      CategoriesCompanion(
        id: Value(category.id),
        name: Value(category.name),
        icon: Value(category.icon),
        color: Value(category.color),
        updatedAt: Value(category.updatedAt),
        createdAt: Value(category.createdAt),
      ),
    );
  }
}
