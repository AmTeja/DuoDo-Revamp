part of 'color_chooser_bloc.dart';

sealed class ColorChooserEvent extends Equatable {
  const ColorChooserEvent();

  @override
  List<Object?> get props => [];
}

class ColorChanged extends ColorChooserEvent {
  const ColorChanged(
    this.color, {
    this.onColorChanged,
  });

  final Color color;
  final void Function(Color color)? onColorChanged;

  @override
  List<Object?> get props => [color, onColorChanged];
}

class CustomColorAdded extends ColorChooserEvent {
  const CustomColorAdded(this.color);

  final Color color;

  @override
  List<Object> get props => [color];
}

class ColorSaved extends ColorChooserEvent {
  const ColorSaved();
}
