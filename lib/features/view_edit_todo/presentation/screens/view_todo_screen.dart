import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/di/dependency_injection.dart';
import 'package:duodo/core/extensions/context_ext.dart';
import 'package:duodo/features/view_edit_todo/presentation/bloc/view_edit_todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ViewTodoScreen extends StatelessWidget {
  const ViewTodoScreen({super.key, required this.todoId});

  final int todoId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewEditTodoBloc(
        viewEditTodoRepository: it.get(),
        todoId: todoId,
      ),
      child: BlocConsumer<ViewEditTodoBloc, ViewEditTodoState>(
        listener: (context, state) {
          if (state is ViewEditTodoDeleted) {
            context.maybePop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Todo deleted successfully'),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state) {
            case ViewEditTodoInitial():
            case ViewEditTodoLoading():
            case ViewEditTodoDeleted():
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ViewEditTodoLoaded():
              return _LoadedBody(state: state);
            case ViewEditTodoError():
              return Scaffold(
                body: Center(
                  child: Text(state.message),
                ),
              );
          }
        },
      ),
    );
  }
}

class _LoadedBody extends StatelessWidget {
  const _LoadedBody({
    required this.state,
  });

  final ViewEditTodoLoaded state;

  @override
  Widget build(BuildContext context) {
    final todo = state.todo;
    return Scaffold(
      floatingActionButton: const _EditFAB(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              showAdaptiveDialog(
                  context: context,
                  builder: (_) {
                    return BlocProvider<ViewEditTodoBloc>.value(
                      value: context.read(),
                      child: AlertDialog(
                        title: const Text('Delete Todo'),
                        content: const Text('Are you sure you want to delete?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context
                                ..read<ViewEditTodoBloc>()
                                    .add(EditDeleteTodo(todo.id))
                                ..maybePop();
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              context.maybePop();
                            },
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    );
                  });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              todo.title,
              style: context.headlineLarge,
            ),
            Row(
              children: [
                if (todo.category != null)
                  Chip(
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    label: Text(todo.category!.name),
                  ),
                const Spacer(),
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: (val) {
                    if (val != null) {
                      context.read<ViewEditTodoBloc>().add(
                            EditUpdateTodo(
                              todo.copyWith(isCompleted: val),
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
            Text(todo.description, style: context.bodyLarge),
          ],
        ),
      ),
    );
  }
}

class _EditFAB extends StatelessWidget {
  const _EditFAB();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewEditTodoBloc, ViewEditTodoState>(
      builder: (context, state) {
        return FloatingActionButton.extended(
          onPressed: () {
            context.pushRoute(
              EditTodoRoute(
                  todo: (state as ViewEditTodoLoaded).todo,
                  bloc: context.read()),
            );
          },
          icon: const Icon(Icons.edit),
          label: const Text('Edit'),
        );
      },
    );
  }
}
