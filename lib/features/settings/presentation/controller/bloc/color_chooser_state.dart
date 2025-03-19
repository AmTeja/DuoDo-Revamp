part of 'color_chooser_bloc.dart';

final class ColorChooserState extends Equatable {
  const ColorChooserState({required this.color, this.addedColors = const []});

  final Color color;
  final List<Color> addedColors;

  final List<Color> _predefinedColors = const [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  List<Color> get colors => [..._predefinedColors, ...addedColors];

  ColorChooserState copyWith({
    Color? color,
    List<Color>? addedColors,
  }) {
    return ColorChooserState(
      color: color ?? this.color,
      addedColors: addedColors ?? this.addedColors,
    );
  }

  @override
  List<Object?> get props => [color, addedColors];
}
