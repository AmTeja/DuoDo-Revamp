import 'package:duodo/core/db/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class TodoCategory with _$TodoCategory {
  const factory TodoCategory({
    int? id,
    required String name,
    required String icon,
    required int? color,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TodoCategory;

  factory TodoCategory.fromJson(Map<String, dynamic> json) =>
      _$TodoCategoryFromJson(json);
}

TodoCategory todoCategoryfromCategoryItem(CategoryItem categoryItem) {
  return TodoCategory(
    id: categoryItem.id,
    name: categoryItem.name,
    icon: categoryItem.icon.toString(),
    color: categoryItem.color,
    createdAt: categoryItem.createdAt,
    updatedAt: categoryItem.updatedAt,
  );
}

CategoryItem categoryItemFromTodoCategory(TodoCategory category) {
  return CategoryItem(
    id: category.id ?? -1,
    name: category.name,
    icon: int.tryParse(category.icon) ?? 0,
    color: category.color,
    createdAt: category.createdAt,
    updatedAt: category.updatedAt,
  );
}
