import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TimeCard extends StatefulWidget {
  final String month;
  final String day;
  final String date;
  final bool active;
  final VoidCallback onTap;

  const TimeCard({
    super.key,
    required this.month,
    required this.day,
    required this.date,
    required this.active,
    required this.onTap,
  });

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.active
          ? Theme.of(context).primaryColor
          : Theme.of(context).colorScheme.surface,
      child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onTap,
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    widget.month,
                    style: ResponsiveBreakpoints.of(context)
                            .between(MOBILE, TABLET)
                        ? Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: widget.active ? Colors.white : null)
                        : Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: widget.active ? Colors.white : null),
                  ),
                  AutoSizeText(
                    widget.date,
                    style: ResponsiveBreakpoints.of(context)
                            .between(MOBILE, TABLET)
                        ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: widget.active ? Colors.white : null)
                        : Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: widget.active ? Colors.white : null),
                  ),
                  AutoSizeText(widget.day,
                      style: ResponsiveBreakpoints.of(context)
                              .between(MOBILE, TABLET)
                          ? Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: widget.active ? Colors.white : null)
                          : Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: widget.active ? Colors.white : null))
                ],
              ))),
    );
  }
}
