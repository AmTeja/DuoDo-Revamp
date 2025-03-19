import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/di/dependency_injection.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/extensions/context_ext.dart';
import 'package:duodo/core/presentation/components/duodo_form_field.dart';
import 'package:duodo/features/create_todo/presentation/bloc/create_todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage<TodoItem?>()
class CreateTodoScreen extends StatelessWidget {
  CreateTodoScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTodoBloc(createTodoRepository: it.get()),
      child: BlocListener<CreateTodoBloc, CreateTodoState>(
        listenWhen: (prev, current) => prev.status != current.status,
        listener: (context, state) {
          if (state.status == CreateTodoStatus.success) {
            context.maybePop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Todo created successfully'),
              ),
            );
          } else if (state.status == CreateTodoStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(
                  state.failureMessage!,
                  style: context.bodyMedium
                      ?.copyWith(color: context.scheme.onErrorContainer),
                ),
                backgroundColor: context.scheme.errorContainer,
              ),
            );
          }
        },
        child: Builder(builder: (context) {
          final createTodoBloc = context.read<CreateTodoBloc>();

          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              heroTag: 'todo_flow',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  createTodoBloc.add(const CreateTodoSubmitted());
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Create'),
            ),
            body: Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar.large(
                    title: Text('Create Todo'),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          DuodoFormField(
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Title cannot be empty';
                              }
                              return null;
                            },
                            onChanged: (val) =>
                                createTodoBloc.add(CreateTodoTitleChanged(val)),
                            label: 'Title',
                          ),
                          const Gap(16),
                          DuodoFormField(
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Description cannot be empty';
                              }
                              return null;
                            },
                            onChanged: (val) => createTodoBloc
                                .add(CreateTodoDescriptionChanged(val)),
                            label: 'Description',
                            maxLines: 5,
                          ),
                          const Gap(16),
                          BlocBuilder<CreateTodoBloc, CreateTodoState>(
                            builder: (context, state) {
                              return DuodoFormField(
                                controller: TextEditingController(
                                  text: state.category?.name ?? '',
                                ),
                                onChanged: (val) {},
                                label: 'Category',
                                readOnly: true,
                                onTap: () async {
                                  FocusScope.of(context).unfocus();

                                  final category = await context.pushRoute<
                                          TodoCategory?>(
                                      AllCategoriesRoute(isSelectMode: true));

                                  if (category != null) {
                                    createTodoBloc.add(
                                        CreateTodoCategoryChanged(category));
                                  }
                                },
                              );
                            },
                          ),
                          const Gap(16),
                          // DuodoFormField(
                          //   onChanged: (_) {},
                          //   label: 'Due Date',
                          //   readOnly: true,
                          //   onTap: () {
                          //     FocusScope.of(context).unfocus();
                          //   },
                          // ),
                          // const Gap(16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
