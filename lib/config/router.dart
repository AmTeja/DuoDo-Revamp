import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/guards/auth_provider.dart';
import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/auth/presentation/screens/auth_screen.dart';
import 'package:duodo/features/category/presentation/screens/all_categories_screen.dart';
import 'package:duodo/features/category/presentation/screens/new_category_screen.dart';
import 'package:duodo/features/create_todo/presentation/screens/create_todo_screen.dart';
import 'package:duodo/features/home/presentation/bloc/home_bloc.dart';
import 'package:duodo/features/home/presentation/screens/all_todos_screen.dart';
import 'package:duodo/features/home/presentation/screens/home_screen.dart';
import 'package:duodo/features/settings/presentation/pages/settings_page.dart';
import 'package:duodo/features/settings/presentation/pages/theme_settings_page.dart';
import 'package:duodo/features/view_edit_todo/presentation/bloc/view_edit_todo_bloc.dart';
import 'package:duodo/features/view_edit_todo/presentation/screens/edit_todo_screen.dart';
import 'package:duodo/features/view_edit_todo/presentation/screens/view_todo_screen.dart';
import 'package:flutter/material.dart' show Key;

part 'router.gr.dart';

final authProvider = AuthProvider();

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: HomeRoute.page, initial: true),
        AutoRoute(path: '/auth', page: AuthRoute.page),
        AutoRoute(path: '/create-todo', page: CreateTodoRoute.page),
        AutoRoute(path: '/view-todo/:todoId', page: ViewTodoRoute.page),
        AutoRoute(path: '/edit-todo/:todoId', page: EditTodoRoute.page),
        AutoRoute(path: '/categories', page: AllCategoriesRoute.page),
        AutoRoute(path: '/all-todos', page: AllTodosRoute.page),
        AutoRoute(path: '/new-category', page: NewCategoryRoute.page),
        AutoRoute(path: '/settings', page: SettingsRoute.page),
        AutoRoute(path: '/theme-settings', page: ThemeSettingsRoute.page),
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authProvider.isGuest ||
        authProvider.isLoggedIn ||
        resolver.route.name == AuthRoute.name) {
      resolver.next(true);
    } else {
      resolver.redirect(const AuthRoute());
    }
  }
}
