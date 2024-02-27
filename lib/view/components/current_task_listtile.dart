import 'package:flutter/material.dart';
import 'package:mytodo/control/route_generator.dart';

class CurrentTaskListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String timestamp;
  final Icon icon;
  final Color? iconBgColor;

  const CurrentTaskListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.icon,
    required this.iconBgColor,
  });

  @override
  State<CurrentTaskListTile> createState() => _CurrentTaskListTileState();
}

class _CurrentTaskListTileState extends State<CurrentTaskListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          ListTile(
            title: Text(widget.title),
            titleTextStyle: Theme.of(context).textTheme.labelLarge,
            subtitle: Text(widget.subtitle),
            subtitleTextStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            trailing: Card(
                color: widget.iconBgColor,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: widget.icon,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.history_toggle_off_outlined,
                        color: Theme.of(context).colorScheme.primary),
                    Text(widget.timestamp,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary))
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.addTask);
                    },
                    child: const Text("Done"))
              ],
            ),
          ),
        ]));
  }
}
