// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );

  if (picked != null) print({picked.toString()});
}

Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null)
    print({picked.hour.toString() + ':' + picked.minute.toString()});
}

Future<void> _selectDateRange(BuildContext context) async {
  final DateTimeRange? picked = await showDateRangePicker(
    context: context,
    initialDateRange: DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 7)),
    ),
    firstDate: DateTime(DateTime.now().year - 5),
    lastDate: DateTime(DateTime.now().year + 5),
  );

  if (picked != null) {
    print({picked.start.toString() + ' - ' + picked.end.toString()});
  }
}
