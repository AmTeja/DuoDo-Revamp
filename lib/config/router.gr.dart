// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllCategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<AllCategoriesRouteArgs>(
          orElse: () => const AllCategoriesRouteArgs());
      return AutoRoutePage<TodoCategory?>(
        routeData: routeData,
        child: AllCategoriesScreen(
          isSelectMode: args.isSelectMode,
          key: args.key,
        ),
      );
    },
    AllTodosRoute.name: (routeData) {
      final args = routeData.argsAs<AllTodosRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllTodosScreen(
          bloc: args.bloc,
          category: args.category,
          key: args.key,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    CreateTodoRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTodoRouteArgs>(
          orElse: () => const CreateTodoRouteArgs());
      return AutoRoutePage<TodoItem?>(
        routeData: routeData,
        child: CreateTodoScreen(key: args.key),
      );
    },
    EditTodoRoute.name: (routeData) {
      final args = routeData.argsAs<EditTodoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditTodoScreen(
          todo: args.todo,
          bloc: args.bloc,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NewCategoryRoute.name: (routeData) {
      return AutoRoutePage<TodoCategory?>(
        routeData: routeData,
        child: const NewCategoryScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    ThemeSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ThemeSettingsPage(),
      );
    },
    ViewTodoRoute.name: (routeData) {
      final args = routeData.argsAs<ViewTodoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ViewTodoScreen(
          key: args.key,
          todoId: args.todoId,
        ),
      );
    },
  };
}

/// generated route for
/// [AllCategoriesScreen]
class AllCategoriesRoute extends PageRouteInfo<AllCategoriesRouteArgs> {
  AllCategoriesRoute({
    bool isSelectMode = false,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AllCategoriesRoute.name,
          args: AllCategoriesRouteArgs(
            isSelectMode: isSelectMode,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AllCategoriesRoute';

  static const PageInfo<AllCategoriesRouteArgs> page =
      PageInfo<AllCategoriesRouteArgs>(name);
}

class AllCategoriesRouteArgs {
  const AllCategoriesRouteArgs({
    this.isSelectMode = false,
    this.key,
  });

  final bool isSelectMode;

  final Key? key;

  @override
  String toString() {
    return 'AllCategoriesRouteArgs{isSelectMode: $isSelectMode, key: $key}';
  }
}

/// generated route for
/// [AllTodosScreen]
class AllTodosRoute extends PageRouteInfo<AllTodosRouteArgs> {
  AllTodosRoute({
    required HomeBloc bloc,
    TodoCategory? category,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AllTodosRoute.name,
          args: AllTodosRouteArgs(
            bloc: bloc,
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AllTodosRoute';

  static const PageInfo<AllTodosRouteArgs> page =
      PageInfo<AllTodosRouteArgs>(name);
}

class AllTodosRouteArgs {
  const AllTodosRouteArgs({
    required this.bloc,
    this.category,
    this.key,
  });

  final HomeBloc bloc;

  final TodoCategory? category;

  final Key? key;

  @override
  String toString() {
    return 'AllTodosRouteArgs{bloc: $bloc, category: $category, key: $key}';
  }
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateTodoScreen]
class CreateTodoRoute extends PageRouteInfo<CreateTodoRouteArgs> {
  CreateTodoRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateTodoRoute.name,
          args: CreateTodoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateTodoRoute';

  static const PageInfo<CreateTodoRouteArgs> page =
      PageInfo<CreateTodoRouteArgs>(name);
}

class CreateTodoRouteArgs {
  const CreateTodoRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateTodoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EditTodoScreen]
class EditTodoRoute extends PageRouteInfo<EditTodoRouteArgs> {
  EditTodoRoute({
    required Todo todo,
    required ViewEditTodoBloc bloc,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditTodoRoute.name,
          args: EditTodoRouteArgs(
            todo: todo,
            bloc: bloc,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTodoRoute';

  static const PageInfo<EditTodoRouteArgs> page =
      PageInfo<EditTodoRouteArgs>(name);
}

class EditTodoRouteArgs {
  const EditTodoRouteArgs({
    required this.todo,
    required this.bloc,
    this.key,
  });

  final Todo todo;

  final ViewEditTodoBloc bloc;

  final Key? key;

  @override
  String toString() {
    return 'EditTodoRouteArgs{todo: $todo, bloc: $bloc, key: $key}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewCategoryScreen]
class NewCategoryRoute extends PageRouteInfo<void> {
  const NewCategoryRoute({List<PageRouteInfo>? children})
      : super(
          NewCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ThemeSettingsPage]
class ThemeSettingsRoute extends PageRouteInfo<void> {
  const ThemeSettingsRoute({List<PageRouteInfo>? children})
      : super(
          ThemeSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ViewTodoScreen]
class ViewTodoRoute extends PageRouteInfo<ViewTodoRouteArgs> {
  ViewTodoRoute({
    Key? key,
    required int todoId,
    List<PageRouteInfo>? children,
  }) : super(
          ViewTodoRoute.name,
          args: ViewTodoRouteArgs(
            key: key,
            todoId: todoId,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewTodoRoute';

  static const PageInfo<ViewTodoRouteArgs> page =
      PageInfo<ViewTodoRouteArgs>(name);
}

class ViewTodoRouteArgs {
  const ViewTodoRouteArgs({
    this.key,
    required this.todoId,
  });

  final Key? key;

  final int todoId;

  @override
  String toString() {
    return 'ViewTodoRouteArgs{key: $key, todoId: $todoId}';
  }
}
