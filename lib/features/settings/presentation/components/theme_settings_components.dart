import 'package:duodo/features/settings/presentation/controller/bloc/color_chooser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ThemeColorCircle extends StatelessWidget {
  const ThemeColorCircle(this.color, {super.key, this.onColorChanged});

  final Color color;
  final void Function(Color)? onColorChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorChooserBloc, ColorChooserState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<ColorChooserBloc>()
                .add(ColorChanged(color, onColorChanged: onColorChanged));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color:
                    state.color == color ? Colors.black87 : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}

class AddCustomColor extends StatefulWidget {
  const AddCustomColor({super.key});

  @override
  State<AddCustomColor> createState() => _AddCustomColorState();
}

class _AddCustomColorState extends State<AddCustomColor> {
  late Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorChooserBloc, ColorChooserState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider<ColorChooserBloc>.value(
                    value: context.read<ColorChooserBloc>(),
                    child: AlertDialog(
                      title: const Text('Add your color'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          onColorChanged: (value) {
                            setState(() {
                              selectedColor = value;
                            });
                          },
                          pickerColor: state.color,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<ColorChooserBloc>()
                              ..add(CustomColorAdded(selectedColor))
                              ..add(ColorChanged(selectedColor));
                            Navigator.of(context).pop();
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 2),
            ),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
