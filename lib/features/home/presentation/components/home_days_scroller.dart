import 'package:duodo/core/extensions/datetime_ext.dart';
import 'package:duodo/core/presentation/components/days_scroller.dart';
import 'package:flutter/material.dart';

class HomeDaysScroller extends StatefulWidget {
  const HomeDaysScroller(
      {required this.onDaySelected, this.onViewAll, super.key});

  final void Function(DateTime) onDaySelected;
  final VoidCallback? onViewAll;

  @override
  State<HomeDaysScroller> createState() => _HomeDaysScrollerState();
}

class _HomeDaysScrollerState extends State<HomeDaysScroller> {
  DateTime today = DateTime.now();
  late DateTime selectedDate = today;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: DaysScroller(
        days: selectedDate.daysInMonth,
        month: selectedDate.month,
        currentDay: today.day,
        onDaySelected: (DateTime value) {
          setState(() {
            selectedDate = value;
          });

          widget.onDaySelected(value);
        },
        scrollController: ScrollController(
          initialScrollOffset:
              selectedDate.day < 4 ? 0 : (selectedDate.day + 1) * (40 + 4),
        ),
        selectedDay: selectedDate.day,
        year: selectedDate.year,
        onViewAll: widget.onViewAll,
      ),
    );
  }
}
