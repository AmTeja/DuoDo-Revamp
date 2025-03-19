part of 'dependency_injection.dart';

void injectCategoriesDependencies() {
  it.registerLazySingleton<CategoriesDataSource>(
    () => CategoriesLocalDataSource(categoriesHelper: it.get()),
  );

  it.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(dataSource: it.get()),
  );
}
