part of 'categories_bloc.dart';

enum CategoriesStatus { initial, loading, loaded, error }

final class CategoriesState extends Equatable {
  const CategoriesState({
    this.categories = const <TodoCategory>[],
    this.status = CategoriesStatus.initial,
  });

  final List<TodoCategory> categories;

  final CategoriesStatus status;

  CategoriesState copyWith({
    List<TodoCategory>? categories,
    CategoriesStatus? status,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [categories, status];
}
