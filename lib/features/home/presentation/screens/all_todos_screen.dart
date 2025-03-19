import 'package:auto_route/auto_route.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/home/presentation/bloc/home_bloc.dart';
import 'package:duodo/features/home/presentation/components/home_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class AllTodosScreen extends StatefulWidget {
  const AllTodosScreen({
    required this.bloc,
    this.category,
    super.key,
  });

  final TodoCategory? category;
  final HomeBloc bloc;

  @override
  State<AllTodosScreen> createState() => _AllTodosScreenState();
}

class _AllTodosScreenState extends State<AllTodosScreen> {
  List<Todo> filteredTodos = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              filteredTodos = widget.category != null
                  ? state.todos
                      .where((element) =>
                          element.category?.id == widget.category?.id)
                      .toList()
                  : state.todos;
              return CustomScrollView(
                slivers: [
                  SliverAppBar.large(
                    title: Text(widget.category?.name ?? 'All Todos'),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList.separated(
                      itemBuilder: (context, index) {
                        return TodoTile(
                          filteredTodos[index],
                          preventNavigation: widget.category != null,
                        );
                      },
                      separatorBuilder: (_, index) =>
                          index == filteredTodos.length - 1
                              ? const Gap(48)
                              : const Gap(8),
                      itemCount: filteredTodos.length,
                    ),
                  ),
                  const SliverGap(48),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
