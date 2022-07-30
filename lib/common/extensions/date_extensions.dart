import 'dart:core';

extension StringExt on DateTime {
  String get dateTostring {
    return '${_monthList[month - 1].substring(0, 3)} $day, $year';
  }
}

List<String> _monthList = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
