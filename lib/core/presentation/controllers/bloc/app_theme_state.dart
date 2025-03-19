part of 'app_theme_bloc.dart';

final class AppThemeState extends Equatable {
  const AppThemeState({
    required this.seedColor,
    this.themeMode = ThemeMode.system,
    this.useMaterial3 = true,
    this.useDynamicColor = false,
    this.dynamicColor,
  });

  final Color? dynamicColor;
  final Color seedColor;
  final ThemeMode themeMode;
  final bool useMaterial3;
  final bool useDynamicColor;

  bool get useSystemTheme => themeMode == ThemeMode.system;

  Color get color => useDynamicColor ? (dynamicColor ?? seedColor) : seedColor;

  AppThemeState copyWith({
    Color? dynamicColor,
    Color? seedColor,
    ThemeMode? themeMode,
    bool? useMaterial3,
    bool? useDynamicColor,
  }) {
    return AppThemeState(
      dynamicColor: dynamicColor ?? this.dynamicColor,
      seedColor: seedColor ?? this.seedColor,
      themeMode: themeMode ?? this.themeMode,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      useDynamicColor: useDynamicColor ?? this.useDynamicColor,
    );
  }

  @override
  List<Object?> get props => [
        dynamicColor,
        seedColor,
        themeMode,
        useMaterial3,
        useDynamicColor,
      ];
}
