import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/di/dependency_injection.dart';
import 'package:duodo/core/exceptions/duo_exception.dart';
import 'package:duodo/core/helpers/duo_logger.dart';
import 'package:duodo/core/presentation/components/sidebar.dart';
import 'package:duodo/features/home/presentation/bloc/home_bloc.dart';
import 'package:duodo/features/home/presentation/components/home_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(homeRepository: it.get())..add(const HomeLoadTodos()),
      child: Scaffold(
        drawer: const AppSidebar(),
        floatingActionButton: FloatingActionButton(
          heroTag: 'todo_flow',
          onPressed: () {
            try {
              context.pushRoute(CreateTodoRoute());
            } on Exception catch (e, s) {
              Log().error(DuoException(e, stackTrace: s));
            }
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          title: const Text('Duodo'),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              HomeDaysScroller(
                onDaySelected: (val) =>
                    context.read<HomeBloc>().add(HomeDayChanged(val)),
                onViewAll: () => context
                    .pushRoute(AllTodosRoute(bloc: context.read<HomeBloc>())),
              ),
              const Gap(16),
              const Expanded(
                child: TodosList(),
              )
            ],
          );
        }),
      ),
    );
  }
}

class TodosList extends StatelessWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStateStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case HomeStateStatus.loaded:
            if (state.todosForSelectedDay.isEmpty) {
              return const Center(child: NoTodos());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 96),
                itemCount: state.todosForSelectedDay.length,
                itemBuilder: (context, index) {
                  final todo = state.todosForSelectedDay[index];
                  return TodoTile(todo);
                },
                separatorBuilder: (context, index) => const Gap(8),
              ),
            );
          default:
            return const Center(child: Text('Error'));
        }
      },
    );
  }
}
