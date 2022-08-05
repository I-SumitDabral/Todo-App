import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

extension StringExt on DateTime {
  String get dateTostring {
    return '${_monthList[month - 1].substring(0, 3)} $day, $year';
  }
}

extension DateExtensions on int {
  String get intToDateString {
    return intToDate.dateTostring;
  }
    DateTime get intToDate {
    final time = Timestamp.fromMillisecondsSinceEpoch(this).toDate();
    return time;
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
