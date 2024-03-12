import 'package:flutter/material.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';

class ProgressCard extends StatefulWidget {
  final Color color;
  final String title;
  final String subtitle;
  final Color progressColor;
  final double? value;
  final Icon icon;
  final Color? iconBgColor;

  const ProgressCard({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.progressColor,
    required this.value,
    required this.icon,
    required this.iconBgColor,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 220,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(8)),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.addTask);
          },
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      Card(
                          color: widget.iconBgColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: widget.icon,
                          )),
                    ],
                  ),
                  Text(widget.subtitle,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  LinearProgressIndicator(
                    value: widget.value,
                    color: widget.progressColor,
                    borderRadius: BorderRadius.circular(8),
                  )
                ],
              ))),
    );
  }
}
