import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/core/presentation/components/duodo_form_field.dart';
import 'package:duodo/features/view_edit_todo/presentation/bloc/view_edit_todo_bloc.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({required this.todo, required this.bloc, super.key});

  final Todo todo;
  final ViewEditTodoBloc bloc;

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late final _titleController = TextEditingController(text: widget.todo.title);
  late final _descriptionController =
      TextEditingController(text: widget.todo.description);

  late TodoCategory? category = widget.todo.category;

  bool get isFormValid =>
      _titleController.text.isNotEmpty &&
      _descriptionController.text.isNotEmpty;
  bool get isFormChanged =>
      _titleController.text != widget.todo.title ||
      _descriptionController.text != widget.todo.description ||
      category != widget.todo.category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (!isFormChanged) {
              context.maybePop();
              return;
            }
            if (isFormValid) {
              widget.bloc.add(
                EditUpdateTodo(
                  widget.todo.copyWith(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    category: category,
                  ),
                ),
              );

              context.maybePop();
            }
          },
          icon: const Icon(Icons.save),
          label: const Text('Save'),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar.large(
              title: Text('Edit Todo'),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      spacing: 16,
                      children: [
                        const SizedBox.shrink(),
                        DuodoFormField(
                          controller: _titleController,
                          onChanged: (_) {},
                          label: 'Title',
                          hintText: 'Title',
                        ),
                        DuodoFormField(
                          controller: _descriptionController,
                          onChanged: (_) {},
                          maxLines: 5,
                          label: 'Description',
                          hintText: 'Description',
                        ),
                        DuodoFormField(
                          onTap: () async {
                            FocusScope.of(context).unfocus();

                            final category =
                                await context.pushRoute<TodoCategory?>(
                                    AllCategoriesRoute(isSelectMode: true));

                            if (category != null) {
                              setState(() {
                                this.category = category;
                              });
                            }
                          },
                          controller:
                              TextEditingController(text: category?.name),
                          onChanged: (val) {},
                          readOnly: true,
                          label: 'Category',
                          hintText: 'Category',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
