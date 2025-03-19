import 'package:auto_route/auto_route.dart';
import 'package:duodo/core/di/dependency_injection.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/extensions/colors_ext.dart';
import 'package:duodo/core/extensions/context_ext.dart';
import 'package:duodo/core/presentation/components/duodo_form_field.dart';
import 'package:duodo/features/settings/presentation/components/theme_settings_components.dart';
import 'package:duodo/features/settings/presentation/controller/bloc/color_chooser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';
import 'package:gap/gap.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

@RoutePage<TodoCategory?>()
class NewCategoryScreen extends StatefulWidget {
  const NewCategoryScreen({super.key});

  @override
  State<NewCategoryScreen> createState() => _NewCategoryScreenState();
}

class _NewCategoryScreenState extends State<NewCategoryScreen> {
  IconData? selectedIcon;
  Color? selectedColor;

  String categoryName = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? categoryNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Category name cannot be empty';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorChooserBloc(localStorageHelper: it.get()),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            heroTag: 'category_flow',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                TodoCategory category = TodoCategory(
                  name: categoryName,
                  icon: selectedIcon!.codePoint.toString(),
                  color: selectedColor?.toInt(),
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                );

                context.router.maybePop(category);
              }
            },
            icon: const Icon(Icons.save),
            label: const Text('Save')),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar.large(
                title: Text('New Category'),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Gap(16),
                    GestureDetector(
                      onTap: () async {
                        await onTapIcon(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: context.scheme.outline),
                        ),
                        child: Icon(
                          selectedIcon ?? Icons.add,
                          size: 48,
                          color: selectedColor,
                        ),
                      ),
                    ),
                    const Gap(16),
                    InkWell(
                      onTap: () {
                        if (selectedIcon != null) {
                          setState(() {
                            selectedIcon = null;
                          });
                        } else {
                          onTapIcon(context);
                        }
                      },
                      child: Text(
                        selectedIcon != null ? 'Clear' : 'Select an icon',
                        style: context.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<ColorChooserBloc, ColorChooserState>(
                    builder: (context, state) {
                  return Padding(
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
                        return ThemeColorCircle(
                          color,
                          onColorChanged: (color) {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                        );
                      },
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DuodoFormField(
                    onChanged: (val) {
                      setState(() {
                        categoryName = val;
                      });
                    },
                    validator: categoryNameValidator,
                    label: 'Name',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onTapIcon(BuildContext context) async {
    IconPickerIcon? icon = await showIconPicker(
      context,
      configuration: SinglePickerConfiguration(
        backgroundColor: context.scheme.surface,
        preSelected: selectedIcon != null
            ? IconPickerIcon(
                data: selectedIcon!,
                name: 'add',
                pack: IconPack.material,
              )
            : null,
        adaptiveDialog: true,
        showTooltips: true,
        showSearchBar: true,
        iconPickerShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        iconPackModes: const [IconPack.material],
        searchComparator: (String search, IconPickerIcon icon) =>
            search
                .toLowerCase()
                .contains(icon.name.replaceAll('_', ' ').toLowerCase()) ||
            icon.name.toLowerCase().contains(search.toLowerCase()),
      ),
    );

    if (icon != null) {
      setState(() {
        selectedIcon = icon.data;
      });
    }
  }
}
