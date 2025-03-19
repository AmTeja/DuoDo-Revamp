import 'package:duodo/config/cache_keys.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/di/dependency_injection.dart';
import 'package:duodo/core/helpers/local_storage_helper.dart';
import 'package:duodo/core/presentation/controllers/bloc/app_theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:dynamic_color/dynamic_color.dart';

Color? _seedColor;
Color? _dynamicColor;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initCore();

  runApp(MyApp());
}

Future<void> initCore() async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FlutterDisplayMode.setHighRefreshRate();

  await onStartupInjection();

  final localStorageHelper = LocalStorageHelper.I;

  // final NotificationAppLaunchDetails? notificationAppLaunchDetails =
  //     await FlutterLocalNotificationsPlugin().getNotificationAppLaunchDetails();

  // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //   final payload = notificationAppLaunchDetails?.notificationResponse?.payload;
  //   if (payload != null) {
  //     // ignore: avoid_print
  //     print('notification payload: $payload');
  //   }
  // }

  var colorString = localStorageHelper.getString(CacheKeys.seedThemeColor);
  if (colorString != null) {
    _seedColor = Color(int.parse('0xFF$colorString'));
  }
  final corePallete = await DynamicColorPlugin.getCorePalette();
  _dynamicColor = corePallete?.toColorScheme().primary;
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeBloc(
        localStorageHelper: it(),
        seedColor: _seedColor,
        dynamicColor: _dynamicColor,
      ),
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Duodo',
            themeMode: state.themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: state.color),
              useMaterial3: state.useMaterial3,
              fontFamily: 'Rosario',
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.dark,
                seedColor: state.color,
              ),
              useMaterial3: state.useMaterial3,
              fontFamily: 'Rosario',
            ),
            routerConfig: _appRouter.config(reevaluateListenable: authProvider),
          );
        },
      ),
    );
  }
}
