part of 'dependency_injection.dart';

void injectCreateTodoDependencies() {
  it.registerLazySingleton<CreateTodoDataSource>(
    () => CreateTodoLocalDataSource(it.get()),
  );

  it.registerLazySingleton<CreateTodoRepository>(
    () => CreateTodoRepositoryImpl(it.get()),
  );
}
