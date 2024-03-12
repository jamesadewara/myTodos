import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';

class NotificatorButton extends StatefulWidget {
  const NotificatorButton({
    super.key,
  });

  @override
  State<NotificatorButton> createState() => _NotificatorButtonState();
}

class _NotificatorButtonState extends State<NotificatorButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        GoRouter.of(context).pushNamed(AppRoutes.notifications);
      },
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
              width: 24,
              height: 24,
              child: Stack(
                children: <Widget>[
                  const Icon(Icons.notifications),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: Theme.of(context).primaryColor,
                      ))
                ],
              ))),
    );
  }
}
