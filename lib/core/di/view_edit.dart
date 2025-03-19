part of 'dependency_injection.dart';

void injectViewEditTodoDependencies() {
  it.registerLazySingleton<ViewEditDataSource>(
    () => ViewEditLocalDatasource(
      todosHelper: it.get(),
    ),
  );

  it.registerLazySingleton<ViewEditTodoRepository>(
    () => ViewEditTodoRepositoryImpl(
      viewEditDataSource: it.get(),
    ),
  );
}
