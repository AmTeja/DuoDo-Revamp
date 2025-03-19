part of 'dependency_injection.dart';

void injectDatabase() {
  it.registerSingleton<DuodoDatabase>(DuodoDatabase());
}

void injectSharedPrefs() {
  it.registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance);
}

Future<void> injectLocalStorageHelper() async {
  await it.isReady<SharedPreferences>();

  it.registerLazySingleton<LocalStorageHelper>(() => LocalStorageHelper.I);
}
