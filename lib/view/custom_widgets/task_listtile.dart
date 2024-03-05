import 'package:flutter/material.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/view/custom_widgets/circular_prorgess.dart';

class TaskListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final double? value;
  final Icon icon;
  final Color? iconBgColor;

  const TaskListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.icon,
    required this.iconBgColor,
  });

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.taskGroup);
      },
      leading: Card(
          color: widget.iconBgColor,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: widget.icon,
          )),
      title: Text(widget.title),
      titleTextStyle: Theme.of(context).textTheme.labelLarge,
      subtitle: Text(widget.subtitle),
      trailing: SizedBox(
          width: 24,
          height: 24,
          child: CustomCircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).colorScheme.onSurface,
            strokeAlign: 4,
            strokeWidth: 4,
            value: widget.value,
          )),
    );
  }
}
