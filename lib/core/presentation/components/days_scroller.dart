import 'package:duodo/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DaysScroller extends StatelessWidget {
  const DaysScroller({
    super.key,
    required this.days,
    required this.onDaySelected,
    required this.scrollController,
    required this.year,
    this.selectedDay = -1,
    this.currentDay = 1,
    this.month = 1,
    this.onViewAll,
  });

  final int days;
  final int selectedDay;
  final int currentDay;
  final int month;
  final int year;
  final void Function(DateTime) onDaySelected;
  final ScrollController scrollController;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime(year, month),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    if (value != null) {
                      onDaySelected(value);
                    }
                  });
                },
                child: Text(
                  DateFormat('MMMM y').format(DateTime(year, month)),
                  style: context.bodyMediumBold?.copyWith(
                    color: context.scheme.onPrimaryContainer,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                onViewAll?.call();
              },
              child: Text(
                'View All',
                style: context.labelMedium,
              ),
            ),
            const Gap(16)
          ],
        ),
        const Gap(8),
        Expanded(
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              controller: scrollController,
              itemCount: days,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final day = index + 1;

                var dateTimeNow = DateTime.now();
                return Padding(
                  padding: const EdgeInsets.only(right: 8).copyWith(
                    left: index == 0 ? 16 : 0,
                  ),
                  child: FilterChip(
                    selected: selectedDay == day,
                    onSelected: (_) =>
                        onDaySelected(DateTime(year, month, day)),
                    label: Text(
                      currentDay == day && month == dateTimeNow.month
                          ? 'Today'
                          : day.toString(),
                    ),
                    side: currentDay == day
                        ? BorderSide(color: context.scheme.primary)
                        : null,
                    labelStyle: context.bodyMedium,
                    showCheckmark: false,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
