import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/di/dependency_injection.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/extensions/context_ext.dart';
import 'package:duodo/features/category/presentation/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage<TodoCategory?>()
class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({this.isSelectMode = false, super.key});

  final bool isSelectMode;

  Color bgColor(BuildContext context, index) => [
        context.scheme.primaryContainer,
        context.scheme.secondaryContainer,
        context.scheme.tertiaryContainer
      ][index % 3];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc(categoriesRepository: it.get()),
      child: Scaffold(
        floatingActionButton: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (isSelectMode) {
              return const SizedBox();
            }

            if (state.status == CategoriesStatus.loading) {
              return const CircularProgressIndicator();
            }

            return FloatingActionButton.extended(
              heroTag: 'category_flow',
              onPressed: () async {
                final TodoCategory? category = await context
                    .pushRoute<TodoCategory?>(const NewCategoryRoute());

                if (category != null && context.mounted) {
                  context.read<CategoriesBloc>().add(AddCategory(category));
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            );
          },
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: isSelectMode
                  ? const Text('Select a category')
                  : const Text('All Categories'),
            ),
            BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                switch (state.status) {
                  case CategoriesStatus.initial:
                  case CategoriesStatus.loading:
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case CategoriesStatus.error:
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text('Error loading categories'),
                      ),
                    );

                  case CategoriesStatus.loaded:
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return CategoryCard(
                          category: category,
                          bgColor: bgColor(context, index),
                          onTap: () {
                            if (isSelectMode) {
                              context.maybePop(category);
                            } else {
                              // context.pushRoute(
                              //   EditCategoryRoute(category: category),
                              // );
                            }
                          },
                        );
                      },
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    required this.bgColor,
    required this.onTap,
    super.key,
  });

  final TodoCategory category;
  final Color bgColor;

  final VoidCallback onTap;

  ColorSwatch get categoryColorSwatch {
    ColorSwatch swatch =
        Colors.primaries[category.id! % Colors.primaries.length];

    return swatch;
  }

  Color categoryColor(BuildContext context) {
    if (category.color == null) {
      return context.scheme.onPrimaryContainer;
    }
    return Color(category.color!);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Icon(
              IconData(int.parse(category.icon), fontFamily: 'MaterialIcons'),
              color: categoryColor(context),
            ),
            Text(
              category.name,
              style: context.bodyLargeBold,
            )
          ],
        ),
      ),
    );
  }
}
