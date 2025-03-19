import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/cache_keys.dart';
import 'package:duodo/core/di/dependency_injection.dart';
import 'package:duodo/core/extensions/context_ext.dart';
import 'package:duodo/core/helpers/local_storage_helper.dart';
import 'package:duodo/core/presentation/controllers/bloc/app_theme_bloc.dart';

import 'package:duodo/features/settings/presentation/components/theme_settings_components.dart';
import 'package:duodo/features/settings/presentation/controller/bloc/color_chooser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorChooserBloc>(
      create: (context) => ColorChooserBloc(
        localStorageHelper: it.get(),
        chosenColor: context.read<AppThemeBloc>().state.seedColor,
      ),
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, appThemestate) {
          return Scaffold(
            appBar: AppBar(title: const Text('Theme')),
            body: BlocBuilder<ColorChooserBloc, ColorChooserState>(
              builder: (context, state) {
                return Theme(
                  data: ThemeData(
                    brightness: appThemestate.themeMode == ThemeMode.dark
                        ? Brightness.dark
                        : Brightness.light,
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: appThemestate.useDynamicColor
                          ? appThemestate.color
                          : state.color,
                      brightness: appThemestate.themeMode == ThemeMode.dark
                          ? Brightness.dark
                          : Brightness.light,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(48),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            shrinkWrap: true,
                            itemCount: state.colors.length + 1,
                            itemBuilder: (context, index) {
                              if (index == state.colors.length) {
                                return const AddCustomColor();
                              }

                              final color = state.colors[index];
                              return ThemeColorCircle(color);
                            },
                          ),
                        ),
                        const Gap(16),
                        ListTile(
                          title: Text(
                            'Dark mode',
                            style: context.bodyLarge?.copyWith(
                              color: context.scheme.onPrimaryContainer,
                            ),
                          ),
                          trailing: BlocBuilder<AppThemeBloc, AppThemeState>(
                            builder: (context, state) {
                              return Switch(
                                value: state.themeMode == ThemeMode.dark,
                                onChanged: (value) {
                                  context
                                      .read<AppThemeBloc>()
                                      .add(ThemeModeChanged(
                                        value
                                            ? ThemeMode.dark
                                            : ThemeMode.light,
                                      ));
                                },
                              );
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Use system theme',
                            style: context.bodyLarge?.copyWith(
                              color: context.scheme.onPrimaryContainer,
                            ),
                          ),
                          trailing: BlocBuilder<AppThemeBloc, AppThemeState>(
                            builder: (context, state) {
                              return Switch(
                                value: state.useSystemTheme,
                                onChanged: (value) {
                                  context.read<AppThemeBloc>().add(
                                        ThemeModeChanged(value
                                            ? ThemeMode.system
                                            : ThemeMode.light),
                                      );
                                },
                              );
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Use Material 3',
                            style: context.bodyLarge?.copyWith(
                              color: context.scheme.onPrimaryContainer,
                            ),
                          ),
                          trailing: BlocBuilder<AppThemeBloc, AppThemeState>(
                            builder: (context, state) {
                              return Switch(
                                value: state.useMaterial3,
                                onChanged: (value) {
                                  context
                                      .read<AppThemeBloc>()
                                      .add(UseMaterial3Changed(value));
                                },
                              );
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Use dynamic color',
                            style: context.bodyLarge?.copyWith(
                              color: context.scheme.onPrimaryContainer,
                            ),
                          ),
                          trailing: BlocBuilder<AppThemeBloc, AppThemeState>(
                            builder: (context, state) {
                              return Switch(
                                value: state.useDynamicColor,
                                onChanged: (value) {
                                  context
                                      .read<AppThemeBloc>()
                                      .add(UseDynamicColorChanged(value));
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: const _SaveColor(),
          );
        },
      ),
    );
  }
}

class _SaveColor extends StatelessWidget {
  const _SaveColor();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, appThemeState) {
        return BlocBuilder<ColorChooserBloc, ColorChooserState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () async {
                context
                  ..read<ColorChooserBloc>().add(const ColorSaved())
                  ..read<AppThemeBloc>().add(ThemeSeedColorChanged(state.color))
                  ..router.maybePop();
                await LocalStorageHelper.I.setString(
                  CacheKeys.seedThemeColor,
                  state.color.value.toRadixString(16),
                );
              },
              backgroundColor: appThemeState.useDynamicColor
                  ? appThemeState.color
                  : state.color,
              child: Icon(
                Icons.check,
                color: state.color.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,
              ),
            );
          },
        );
      },
    );
  }
}
