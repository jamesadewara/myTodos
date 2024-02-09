import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:mytodo/view/components/notificator.dart';

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
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                  // leading: CachedNetworkImage(
                                  //     height: 180,
                                  //     imageUrl: "https://www.com",
                                  //     progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  //         Center(
                                  //             child: CircularProgressIndicator(
                                  //                 value: downloadProgress.progress)),
                                  //     errorWidget: (context, url, error) =>
                                  //         const Icon(Icons.person)),
                                  title: Text(
                                    "Hello!",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  subtitle: Text(
                                    "Adewara James",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Stack(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                                icon: const Icon(
                                                    Icons.notifications),
                                                onPressed: () {}),
                                          ),
                                          Positioned(
                                              right: 2,
                                              top: 12,
                                              child: Icon(
                                                Icons.circle,
                                                size: 8,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ))
                                        ],
                                      ))),
                              Container(
                                  height: 140,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          top: 8,
                                          bottom: 24),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  AutoSizeText(
                                                    "Your today's task\n almost done!",
                                                    softWrap: true,
                                                    wrapWords: true,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimary),
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                          "Continue"))
                                                ]),
                                            SizedBox(
                                              width: 84,
                                              height: 84,
                                              child: Stack(
                                                children: <Widget>[
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeAlign: 8,
                                                      strokeWidth: 4,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primaryContainer,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "85%",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onPrimary),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.more_horiz,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary,
                                                    ),
                                                    onPressed: () {},
                                                  )
                                                ]),
                                          ]))),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AutoSizeText("In Progress",
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  IconButton(
                                      iconSize: 16,
                                      splashColor: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      onPressed: () {},
                                      icon: AutoSizeText("6",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)))
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 120,
                                          width: 220,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFBBE4E7),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 8,
                                                  bottom: 12),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Office Project",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                      const Card(
                                                          child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Icon(
                                                          Icons.badge,
                                                          size: 16,
                                                        ),
                                                      )),
                                                    ],
                                                  ),
                                                  Text(
                                                      "Grocery shopping app design",
                                                      textAlign: TextAlign.left,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  LinearProgressIndicator(
                                                    value: 0.75,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  )
                                                ],
                                              ))),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                          height: 120,
                                          width: 220,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFBBE4E7),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 8,
                                                  bottom: 12),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Office Project",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                      const Card(
                                                          child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Icon(
                                                          Icons.badge,
                                                          size: 16,
                                                        ),
                                                      )),
                                                    ],
                                                  ),
                                                  Text(
                                                      "Grocery shopping app design",
                                                      textAlign: TextAlign.left,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  LinearProgressIndicator(
                                                    value: 0.75,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  )
                                                ],
                                              )))
                                    ],
                                  )),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AutoSizeText("Task Groups",
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  IconButton(
                                      iconSize: 16,
                                      splashColor: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      onPressed: () {},
                                      icon: AutoSizeText("4",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)))
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Card(
                                  child: ListTile(
                                leading: const Card(
                                  child: Icon(Icons.badge),
                                ),
                                title: const Text("Personal Project"),
                                titleTextStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                subtitle: const Text("30 Tasks"),
                                trailing: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Stack(
                                    children: <Widget>[
                                      const Align(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(
                                          strokeAlign: 4,
                                          strokeWidth: 4,
                                          value: .52,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "85%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                              const SizedBox(
                                height: 12,
                              ),
                              Card(
                                  child: ListTile(
                                leading: const Card(
                                  child: Icon(Icons.badge),
                                ),
                                title: const Text("Personal Project"),
                                titleTextStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                subtitle: const Text("30 Tasks"),
                                trailing: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Stack(
                                    children: <Widget>[
                                      const Align(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(
                                          strokeAlign: 4,
                                          strokeWidth: 4,
                                          value: .52,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "85%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                              const SizedBox(
                                height: 12,
                              ),
                              Card(
                                  child: ListTile(
                                leading: const Card(
                                  child: Icon(Icons.badge),
                                ),
                                title: const Text("Personal Project"),
                                titleTextStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                subtitle: const Text("30 Tasks"),
                                trailing: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Stack(
                                    children: <Widget>[
                                      const Align(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(
                                          strokeAlign: 4,
                                          strokeWidth: 4,
                                          value: .52,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "85%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                              const SizedBox(
                                height: 48,
                              ),
                            ]))))));
  }
}
