import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:mytodo/src/view/custom_widgets/current_task_listtile.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/view/custom_widgets/time_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TaskScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const TaskScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppNavigationBar(
        currentState: 1,
        automaticallyImplyLeading: false,
        title: Text(context.tr("todayTaskTitle")),
        child: const SafeArea(
          child: TaskPage(),
        ));
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({
    super.key,
  });

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: _scrollController,
        notificationPredicate: (ScrollNotification notification) {
          return notification.depth == 0;
        },
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: ResponsiveBreakpoints.of(context)
                                .between(MOBILE, TABLET)
                            ? 8
                            : 72,
                        right: ResponsiveBreakpoints.of(context)
                                .between(MOBILE, TABLET)
                            ? 8
                            : 72),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TimeCard(
                                      month: "May",
                                      day: "23",
                                      date: "Fri",
                                      active: true,
                                      onTap: () {}),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InputChip(
                                      label: const Text("All"),
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      onSelected: (bool active) {},
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    InputChip(
                                      label: const Text("To-do"),
                                      labelStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.surface,
                                      onSelected: (bool active) {},
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    InputChip(
                                      label: const Text("In Progress"),
                                      labelStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.surface,
                                      onSelected: (bool active) {},
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    InputChip(
                                      label: const Text("Completed"),
                                      labelStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.surface,
                                      onSelected: (bool active) {},
                                    )
                                  ])),
                          const SizedBox(
                            height: 8,
                          ),
                          CurrentTaskListTile(
                            title: "Grocery shopping app design",
                            subtitle: "Market Research",
                            timestamp: "10:00 AM",
                            icon: Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                            iconBgColor: Theme.of(context).colorScheme.surface,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ])))));
  }
}
