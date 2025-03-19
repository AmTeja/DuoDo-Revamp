import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
  String get formattedDate => "$day/$month/$year";
  String get formattedTime => "$hour:$minute";
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (difference.inDays > 365) {
      return "${difference.inDays ~/ 365} year${difference.inDays ~/ 365 > 1 ? 's' : ''} ago";
    } else if (difference.inDays > 30) {
      return "${difference.inDays ~/ 30} month${difference.inDays ~/ 30 > 1 ? 's' : ''} ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago";
    } else {
      return "Just now";
    }
  }

  int get daysInMonth =>
      DateTime(year, month + 1).difference(DateTime(year, month)).inDays;

  bool matchDayMonthYear(DateTime? dateTime) {
    if (dateTime == null) return false;
    return day == dateTime.day &&
        month == dateTime.month &&
        year == dateTime.year;
  }
}

extension TimeOfDayExt on TimeOfDay {
  String get formattedTime => "$hour:$minute";
  DateTime? toDateTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, hour, minute);
  }
}
