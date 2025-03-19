// Create a beautiful widget to show when there are no todos for the selected day.

import 'package:duodo/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoTodos extends StatelessWidget {
  const NoTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: context.scheme.onTertiaryContainer,
            ),
            const Gap(16),
            Text(
              'No todos for this day',
              style: TextStyle(
                fontSize: 18,
                color: context.scheme.onTertiaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
