part of 'dependency_injection.dart';

void injectHomeDependencies() {
  it.registerLazySingleton<HomeDataSource>(
    () => HomeLocalDataSource(it.get()),
  );

  it.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(it.get()),
  );
}
