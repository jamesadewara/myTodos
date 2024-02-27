import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TaskGroupScreen extends StatefulWidget {
  const TaskGroupScreen({
    super.key,
  });

  @override
  State<TaskGroupScreen> createState() => _TaskGroupScreenState();
}

class _TaskGroupScreenState extends State<TaskGroupScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const TaskGroupPage();
  }
}

class TaskGroupPage extends StatefulWidget {
  const TaskGroupPage({
    super.key,
  });

  @override
  State<TaskGroupPage> createState() => _TaskGroupPageState();
}

class _TaskGroupPageState extends State<TaskGroupPage> {
  final _scrollController = ScrollController();
  bool hideAppBar = true;
  bool isSearchabble = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    hideAppBar = true;
    isSearchabble = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: !isSearchabble,
          title: !isSearchabble
              ? const Text("Personal Project")
              : SearchBar(
                  controller: _searchController,
                  elevation: MaterialStateProperty.all(0),
                  hintText: 'Search for apps...',
                  hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.grey)),
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[
                    Visibility(
                      visible: _searchController.text.isNotEmpty,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                        },
                      ),
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _searchController;
                    });
                  },
                  shape:
                      MaterialStateProperty.all(const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ))),
          actions: <Widget>[
            isSearchabble
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        isSearchabble = false;
                      });
                    },
                  )
                : Visibility(
                    visible: !hideAppBar,
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          isSearchabble = true;
                        });
                      },
                    ),
                  )
          ],
        ),
        body: Scrollbar(
            controller: _scrollController,
            notificationPredicate: (ScrollNotification notification) {
              if (_scrollController.offset > 48) {
                setState(() {
                  hideAppBar = false;
                });
              } else {
                setState(() {
                  hideAppBar = true;
                });
              }

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 16),
                              Visibility(
                                visible: !isSearchabble,
                                child: Center(
                                  child: SearchBar(
                                      controller: _searchController,
                                      constraints:
                                          ResponsiveBreakpoints.of(context)
                                                  .between(MOBILE, TABLET)
                                              ? const BoxConstraints(
                                                  maxWidth: 280,
                                                )
                                              : null,
                                      elevation: MaterialStateProperty.all(2),
                                      hintText: 'Search for apps...',
                                      hintStyle: MaterialStateProperty.all(
                                          const TextStyle(color: Colors.grey)),
                                      leading: const Icon(Icons.search),
                                      onChanged: (value) {
                                        setState(() {
                                          _searchController;
                                        });
                                      },
                                      trailing: <Widget>[
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            _searchController.clear();
                                          },
                                        ),
                                      ],
                                      shape: MaterialStateProperty.all(
                                          const ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ))),
                                ),
                              ),
                              const SizedBox(height: 16),
                              AutoSizeText(
                                "Results: 1",
                                maxLines: 1,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(height: 8),
                              AutoSizeText(
                                "30 Apps found",
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(height: 32),
                              ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                leading: const Card(
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Operation Build App"),
                                subtitle: const Text(
                                    "I want to build my very own app..."),
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                leading: const Card(
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Operation Build App"),
                                subtitle: const Text(
                                    "I want to build my very own app..."),
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                leading: const Card(
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Operation Build App"),
                                subtitle: const Text(
                                    "I want to build my very own app..."),
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                leading: const Card(
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Operation Build App"),
                                subtitle: const Text(
                                    "I want to build my very own app..."),
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                leading: const Card(
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Operation Build App"),
                                subtitle: const Text(
                                    "I want to build my very own app..."),
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                leading: const Card(
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Operation Build App"),
                                subtitle: const Text(
                                    "I want to build my very own app..."),
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                leading: const Card(
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Operation Build App"),
                                subtitle: const Text(
                                    "I want to build my very own app..."),
                              )
                            ]))))));
  }
}
