import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/db/db_item_helpers/categories_helper.dart';
import 'package:duodo/core/db/db_item_helpers/todos_helper.dart';
import 'package:duodo/core/helpers/duo_logger.dart';
import 'package:duodo/core/helpers/local_storage_helper.dart';
import 'package:duodo/features/category/data/datasources/categories_data_source.dart';
import 'package:duodo/features/category/data/datasources/categories_local_data_source.dart';
import 'package:duodo/features/category/data/repositories/categories_repository_impl.dart';
import 'package:duodo/features/category/domain/repositories/categories_repository.dart';
import 'package:duodo/features/create_todo/data/datasources/create_todo_data_source.dart';
import 'package:duodo/features/create_todo/data/datasources/create_todo_local_data_source.dart';
import 'package:duodo/features/create_todo/data/repositories/create_todo_repository_impl.dart';
import 'package:duodo/features/create_todo/domain/repository/create_todo_repository.dart';
import 'package:duodo/features/home/data/datasource/home_data_source.dart';
import 'package:duodo/features/home/data/datasource/home_local_data_source.dart';
import 'package:duodo/features/home/data/repositories/home_repository_impl.dart';
import 'package:duodo/features/home/domain/repositories/home_repository.dart';
import 'package:duodo/features/view_edit_todo/data/datasources/view_edit_datasource.dart';
import 'package:duodo/features/view_edit_todo/data/datasources/view_edit_local_datasource.dart';
import 'package:duodo/features/view_edit_todo/data/repositories/view_edit_todo_repository_impl.dart';
import 'package:duodo/features/view_edit_todo/domain/repositories/view_edit_todo_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'database.dart';
part 'db_helpers.dart';
part 'home.dart';
part 'categories.dart';
part 'create_todo.dart';
part 'view_edit.dart';

final it = GetIt.instance;

Future<void> onStartupInjection() async {
  injectDatabase();
  injectSharedPrefs();
  await injectLocalStorageHelper();
  injectDBHelpers();

  injectHomeDependencies();
  injectCategoriesDependencies();
  injectCreateTodoDependencies();
  injectViewEditTodoDependencies();

  Log().info('On Startup Injection Completed');
}
