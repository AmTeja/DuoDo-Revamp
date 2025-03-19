part of 'dependency_injection.dart';

void injectDBHelpers() {
  it.registerLazySingleton<TodosHelper>(
    () => TodosHelper(
        it.get<DuodoDatabase>().todos, it.get<DuodoDatabase>().categories),
  );

  it.registerLazySingleton<CategoriesHelper>(
    () => CategoriesHelper(it.get<DuodoDatabase>().categories),
  );
}
