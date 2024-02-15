import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:mytodo/view/components/notificator.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    super.key,
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
    return const AppNavigationBar(
        currentState: 1,
        child: SafeArea(
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
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Todays' Tasks"),
          actions: const <Widget>[
            NotificatorButton(),
          ],
        ),
        body: Scrollbar(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {},
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      "May",
                                                      style: ResponsiveBreakpoints
                                                                  .of(context)
                                                              .between(MOBILE,
                                                                  TABLET)
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .labelSmall
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .displaySmall,
                                                    ),
                                                    AutoSizeText("23",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(
                                                                    MOBILE, TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .bodyLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displayLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                    AutoSizeText("Fri",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(MOBILE,
                                                                    TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .labelSmall
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displaySmall)
                                                  ],
                                                ))),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Card(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {},
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      "May",
                                                      style: ResponsiveBreakpoints
                                                                  .of(context)
                                                              .between(MOBILE,
                                                                  TABLET)
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .labelSmall
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .displaySmall,
                                                    ),
                                                    AutoSizeText("24",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(
                                                                    MOBILE, TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .bodyLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displayLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                    Text("Sat",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(MOBILE,
                                                                    TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .labelSmall
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displaySmall)
                                                  ],
                                                ))),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Card(
                                        color: Theme.of(context).primaryColor,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {},
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      "May",
                                                      style: ResponsiveBreakpoints
                                                                  .of(context)
                                                              .between(MOBILE,
                                                                  TABLET)
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .labelSmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white)
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .displaySmall
                                                              ?.copyWith(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                    ),
                                                    AutoSizeText("25",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(
                                                                    MOBILE, TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .bodyLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white)
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displayLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors.white)),
                                                    Text("Sun",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(MOBILE,
                                                                    TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .labelSmall
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white)
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displaySmall
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white))
                                                  ],
                                                ))),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Card(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {},
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      "May",
                                                      style: ResponsiveBreakpoints
                                                                  .of(context)
                                                              .between(MOBILE,
                                                                  TABLET)
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .labelSmall
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .displaySmall,
                                                    ),
                                                    AutoSizeText("26",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(
                                                                    MOBILE, TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .bodyLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displayLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                    AutoSizeText("Mon",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(MOBILE,
                                                                    TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .labelSmall
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displaySmall)
                                                  ],
                                                ))),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Card(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {},
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      "May",
                                                      style: ResponsiveBreakpoints
                                                                  .of(context)
                                                              .between(MOBILE,
                                                                  TABLET)
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .labelSmall
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .displaySmall,
                                                    ),
                                                    AutoSizeText("27",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(
                                                                    MOBILE, TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .bodyLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displayLarge
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                    AutoSizeText("Tue",
                                                        style: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .between(MOBILE,
                                                                    TABLET)
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .labelSmall
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displaySmall)
                                                  ],
                                                ))),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 16,
                              ),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InputChip(
                                          label: const Text("All"),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
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
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .surface,
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
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .surface,
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
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          onSelected: (bool active) {},
                                        )
                                      ])),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(children: [
                                    ListTile(
                                      title: const Text(
                                          "Grocery shopping app design"),
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                      subtitle: const Text("Market Research"),
                                      subtitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                      trailing: Card(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Icon(
                                              Icons.person,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 16,
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16, bottom: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                  Icons
                                                      .history_toggle_off_outlined,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                              Text("10:00 AM",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary))
                                            ],
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: const Text("Done"))
                                        ],
                                      ),
                                    ),
                                  ])),
                              const SizedBox(
                                height: 12,
                              ),
                            ]))))));
  }
}
