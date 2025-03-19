import 'package:duodo/config/cache_keys.dart';
import 'package:duodo/core/helpers/local_storage_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc({
    required LocalStorageHelper localStorageHelper,
    Color? seedColor,
    Color? dynamicColor,
  })  : _localStorageHelper = localStorageHelper,
        super(AppThemeState(
          dynamicColor: dynamicColor,
          seedColor: seedColor ?? Colors.deepPurple,
          themeMode: themeMode(localStorageHelper),
          useMaterial3:
              localStorageHelper.getBool(CacheKeys.useMaterial3) ?? true,
          useDynamicColor:
              localStorageHelper.getBool(CacheKeys.useDynamicColor) ?? false,
        )) {
    on<ThemeSeedColorChanged>(_onThemeSeedColorChanged);
    on<ThemeModeChanged>(_onThemeModeChanged);
    on<UseMaterial3Changed>(_onUseMaterial3Changed);
    on<UseDynamicColorChanged>(_onUseDynamicColorChanged);
  }

  static ThemeMode themeMode(LocalStorageHelper localStorageHelper) {
    var isDarkTheme = localStorageHelper.getBool(CacheKeys.isDarkTheme);
    var usingSystemTheme =
        localStorageHelper.getBool(CacheKeys.usingSystemTheme);

    if (usingSystemTheme != null && usingSystemTheme) {
      return ThemeMode.system;
    } else if (isDarkTheme != null) {
      return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  final LocalStorageHelper _localStorageHelper;

  void _onThemeSeedColorChanged(
    ThemeSeedColorChanged event,
    Emitter<AppThemeState> emit,
  ) {
    emit(state.copyWith(seedColor: event.seedColor));
  }

  void _onThemeModeChanged(
    ThemeModeChanged event,
    Emitter<AppThemeState> emit,
  ) {
    if (event.themeMode == ThemeMode.system) {
      _localStorageHelper.setBool(CacheKeys.usingSystemTheme, true);
    } else {
      _localStorageHelper.setBool(CacheKeys.usingSystemTheme, false);
      _localStorageHelper.setBool(
        CacheKeys.isDarkTheme,
        event.themeMode == ThemeMode.dark,
      );
    }
    emit(state.copyWith(themeMode: event.themeMode));
  }

  void _onUseMaterial3Changed(
    UseMaterial3Changed event,
    Emitter<AppThemeState> emit,
  ) {
    _localStorageHelper.setBool(CacheKeys.useMaterial3, event.useMaterial3);
    emit(state.copyWith(useMaterial3: event.useMaterial3));
  }

  void _onUseDynamicColorChanged(
    UseDynamicColorChanged event,
    Emitter<AppThemeState> emit,
  ) {
    _localStorageHelper.setBool(
        CacheKeys.useDynamicColor, event.useDynamicColor);
    emit(state.copyWith(useDynamicColor: event.useDynamicColor));
  }
}
