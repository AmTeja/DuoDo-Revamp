import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(this.todo, {this.preventNavigation = false, super.key});

  final Todo todo;
  final bool preventNavigation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: preventNavigation
          ? null
          : () {
              context.pushRoute(ViewTodoRoute(todoId: todo.id));
            },
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (todo.category != null)
                InkWell(
                  onTap: preventNavigation
                      ? null
                      : () {
                          context.pushRoute(
                            AllTodosRoute(
                              category: todo.category,
                              bloc: context.read<HomeBloc>(),
                            ),
                          );
                        },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Chip(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      label: Text(todo.category!.name),
                    ),
                  ),
                ),
              const Gap(8),
              ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (val) {
                    if (val != null) {
                      context.read<HomeBloc>().add(
                          HomeTodoUpdated(todo.copyWith(isCompleted: val)));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
