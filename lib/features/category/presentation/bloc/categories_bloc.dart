import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/features/category/domain/repositories/categories_repository.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(const CategoriesState()) {
    on<LoadCategories>(_onLoadCategories);
    on<CategoriesLoaded>(_onCategoriesLoaded);
    on<AddCategory>(_onAddCategory);

    add(const LoadCategories());
  }

  final CategoriesRepository _categoriesRepository;

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    _categoriesRepository.getCategories().listen((categories) {
      add(CategoriesLoaded(categories));
    });
  }

  Future<void> _onAddCategory(
    AddCategory event,
    Emitter<CategoriesState> emit,
  ) async {
    await _categoriesRepository.addCategory(event.category);
  }

  void _onCategoriesLoaded(
    CategoriesLoaded event,
    Emitter<CategoriesState> emit,
  ) {
    emit(state.copyWith(
      status: CategoriesStatus.loaded,
      categories: event.categories,
    ));
  }
}
