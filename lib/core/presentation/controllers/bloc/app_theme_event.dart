part of 'app_theme_bloc.dart';

sealed class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeSeedColorChanged extends AppThemeEvent {
  final Color seedColor;

  const ThemeSeedColorChanged(this.seedColor);

  @override
  List<Object> get props => [seedColor];
}

class ThemeModeInitial extends AppThemeEvent {
  const ThemeModeInitial(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}

class ThemeModeChanged extends AppThemeEvent {
  final ThemeMode themeMode;

  const ThemeModeChanged(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

class UseMaterial3Changed extends AppThemeEvent {
  final bool useMaterial3;

  const UseMaterial3Changed(this.useMaterial3);

  @override
  List<Object> get props => [useMaterial3];
}

class UseDynamicColorChanged extends AppThemeEvent {
  final bool useDynamicColor;

  const UseDynamicColorChanged(this.useDynamicColor);

  @override
  List<Object> get props => [useDynamicColor];
}
