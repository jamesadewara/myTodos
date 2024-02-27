// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

Future<void> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );

  if (picked != null) print({picked.toString()});
}

Future<void> selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null) {}
  // print({picked.hour.toString() + ':' + picked.minute.toString()});
}

Future<void> selectDateRange(BuildContext context) async {
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
    // print({picked.start.toString() + ' - ' + picked.end.toString()});
  }
}

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({
    super.key,
  });

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  bool initialState = true;

  @override
  void initState() {
    initialState = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initialState
        ? TimePickerDialog(
            initialTime: TimeOfDay.now(),
            onEntryModeChanged: (TimePickerEntryMode picker) {
              setState(() {
                initialState = false;
              });
            },
          )
        : DatePickerDialog(
            firstDate: DateTime.now(),
            lastDate: DateTime.now(),
            onDatePickerModeChange: (DatePickerEntryMode picker) {
              setState(() {
                initialState = true;
              });
            });
  }
}
