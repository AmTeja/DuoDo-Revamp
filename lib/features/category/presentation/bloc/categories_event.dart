part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoriesEvent {
  const LoadCategories();
}

class CategoriesLoaded extends CategoriesEvent {
  final List<TodoCategory> categories;

  const CategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class AddCategory extends CategoriesEvent {
  final TodoCategory category;

  const AddCategory(this.category);

  @override
  List<Object> get props => [category];
}
