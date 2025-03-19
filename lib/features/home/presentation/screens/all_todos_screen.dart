import 'package:auto_route/auto_route.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/features/home/presentation/bloc/home_bloc.dart';
import 'package:duodo/features/home/presentation/components/home_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

enum TodoFilter {
  all,
  active,
  completed;

  @override
  String toString() {
    switch (this) {
      case TodoFilter.all:
        return 'All';
      case TodoFilter.active:
        return 'Active';
      case TodoFilter.completed:
        return 'Completed';
    }
  }
}

enum SortTodosBy {
  none,
  title,
  date;

  @override
  String toString() {
    switch (this) {
      case SortTodosBy.none:
        return 'None';
      case SortTodosBy.title:
        return 'Title';
      case SortTodosBy.date:
        return 'Date';
    }
  }
}

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
  List<Todo> categorizedTodos = [];
  TodoFilter filter = TodoFilter.all;
  SortTodosBy sort = SortTodosBy.none;

  /// Getters
  List<Todo> get todos {
    final filteredTodos = categorizedTodos.where((element) {
      switch (filter) {
        case TodoFilter.all:
          return true;
        case TodoFilter.active:
          return !element.isCompleted;
        case TodoFilter.completed:
          return element.isCompleted;
      }
    }).toList();

    switch (sort) {
      case SortTodosBy.none:
        return filteredTodos;
      case SortTodosBy.title:
        // Sort by title
        return filteredTodos..sort((a, b) => a.title.compareTo(b.title));
      case SortTodosBy.date:
        return filteredTodos
          ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              categorizedTodos = widget.category != null
                  ? state.todos
                      .where((element) =>
                          element.category?.id == widget.category?.id)
                      .toList()
                  : state.todos;
              return CustomScrollView(
                slivers: [
                  SliverAppBar.large(
                    title: Text(widget.category?.name ?? 'All Todos'),
                    floating: false,
                    pinned: true,
                    actionsPadding: const EdgeInsets.all(8),
                    actions: [
                      SortTodosButton(
                        selectedSort: sort,
                        onSortSelected: (sort) {
                          setState(() {
                            this.sort = sort;
                          });
                        },
                      ),
                    ],
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList.separated(
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return FilterChips(
                            selectedFilter: filter,
                            onFilterSelected: (filter) {
                              setState(() {
                                this.filter = filter;
                              });
                            },
                          );
                        }
                        return TodoTile(
                          todos[index - 1],
                          preventNavigation: widget.category != null,
                        );
                      },
                      separatorBuilder: (_, index) =>
                          index == todos.length ? const Gap(48) : const Gap(8),
                      itemCount: todos.length + 1,
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

class FilterChips extends StatelessWidget {
  const FilterChips({
    required this.onFilterSelected,
    required this.selectedFilter,
    super.key,
  });
  final TodoFilter selectedFilter;
  final void Function(TodoFilter filter) onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: TodoFilter.values
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(e.toString().split('.').last),
                selected: selectedFilter == e,
                onSelected: (selected) {
                  if (selected) {
                    onFilterSelected(e);
                  }
                },
              ),
            ),
          )
          .toList(),
    );
  }
}

class SortTodosButton extends StatelessWidget {
  const SortTodosButton({
    required this.selectedSort,
    required this.onSortSelected,
    super.key,
  });

  final SortTodosBy selectedSort;
  final void Function(SortTodosBy) onSortSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: SortTodosBy.values
                        .map(
                          (e) => ListTile(
                            title: Text(e.toString().split('.').last),
                            onTap: () {
                              onSortSelected(e);
                              context.maybePop();
                            },
                            trailing: selectedSort == e
                                ? Icon(
                                    Icons.check,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : null,
                          ),
                        )
                        .toList(),
                  ),
                );
              });
        },
        icon: const Icon(Icons.sort));
  }
}
