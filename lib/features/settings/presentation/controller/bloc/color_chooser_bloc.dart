import 'package:duodo/config/cache_keys.dart';
import 'package:duodo/core/helpers/local_storage_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_chooser_event.dart';
part 'color_chooser_state.dart';

class ColorChooserBloc extends Bloc<ColorChooserEvent, ColorChooserState> {
  ColorChooserBloc({
    required LocalStorageHelper localStorageHelper,
    Color? chosenColor,
  })  : _localStorageHelper = localStorageHelper,
        super(ColorChooserState(
          color: chosenColor ?? Colors.purple,
          addedColors: _addedColors(localStorageHelper),
        )) {
    on<ColorChanged>(_onColorChanged);
    on<ColorSaved>(_onColorSaved);
    on<CustomColorAdded>(_onCustomColorAdded);
  }

  static List<Color> _addedColors(LocalStorageHelper localStorageHelper) {
    final colorStrings =
        localStorageHelper.getStringList(CacheKeys.addedCustomColors) ?? [];

    return colorStrings.map((e) => Color(int.parse('0xFF$e'))).toList();
  }

  final LocalStorageHelper _localStorageHelper;

  void _onColorChanged(
    ColorChanged event,
    Emitter<ColorChooserState> emit,
  ) {
    event.onColorChanged?.call(event.color);
    emit(state.copyWith(color: event.color));
  }

  void _onColorSaved(
    ColorSaved event,
    Emitter<ColorChooserState> emit,
  ) async {
    try {
      // if color doesnt exist in added Custom colors, add it
      final localColorsList =
          _localStorageHelper.getStringList(CacheKeys.addedCustomColors) ?? [];

      if (localColorsList.contains(state.color.value.toRadixString(16))) {
        return;
      }

      _localStorageHelper.setStringList(
        CacheKeys.addedCustomColors,
        state.addedColors.map((e) => e.value.toRadixString(16)).toList(),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error saving color: $e');
      }
    }
  }

  void _onCustomColorAdded(
    CustomColorAdded event,
    Emitter<ColorChooserState> emit,
  ) {
    emit(state.copyWith(addedColors: [...state.addedColors, event.color]));

    final colorStrings =
        _localStorageHelper.getStringList(CacheKeys.addedCustomColors) ?? [];

    if (colorStrings.contains(event.color.value.toRadixString(16))) {
      return;
    } else {
      _localStorageHelper.setStringList(
        CacheKeys.addedCustomColors,
        state.addedColors.map((e) => e.value.toRadixString(16)).toList(),
      );
    }
  }
}
