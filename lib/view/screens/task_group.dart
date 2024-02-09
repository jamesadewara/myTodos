import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:mytodo/view/components/notificator.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

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
          automaticallyImplyLeading: !isSearchabble,
          title: !isSearchabble
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: Icon(Icons.badge, color: Colors.pink),
                    ),
                    Text("Personal Project")
                  ],
                )
              : SearchBar(
                  controller: _searchController,
                  elevation: MaterialStateProperty.all(0),
                  hintText: 'Search for apps...',
                  hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.grey)),
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        _searchController.clear();
                      },
                    ),
                  ],
                  onChanged: (String value) {},
                  shape:
                      MaterialStateProperty.all(const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ))),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.filter_list_outlined),
              onPressed: () {},
            ),
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
                                      trailing: <Widget>[
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            _searchController.clear();
                                          },
                                        ),
                                      ],
                                      onChanged: (String value) {},
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
                              Card(
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      leading: const Card(
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title: const Text("Operation Build App"),
                                      subtitle: const Text(
                                          "I want to build my very own app..."),
                                      trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Stack(
                                                children: <Widget>[
                                                  const Align(
                                                    alignment: Alignment.center,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeAlign: 2,
                                                      strokeWidth: 2,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Text("7 m")
                                          ]))),
                              Card(
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      leading: const Card(
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title: const Text("Operation Build App"),
                                      subtitle: const Text(
                                          "I want to build my very own app..."),
                                      trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Stack(
                                                children: <Widget>[
                                                  const Align(
                                                    alignment: Alignment.center,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeAlign: 2,
                                                      strokeWidth: 2,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Text("7 m")
                                          ]))),
                              Card(
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      leading: const Card(
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title: const Text("Operation Build App"),
                                      subtitle: const Text(
                                          "I want to build my very own app..."),
                                      trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Stack(
                                                children: <Widget>[
                                                  const Align(
                                                    alignment: Alignment.center,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeAlign: 2,
                                                      strokeWidth: 2,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Text("7 m")
                                          ]))),
                              Card(
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      leading: const Card(
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title: const Text("Operation Build App"),
                                      subtitle: const Text(
                                          "I want to build my very own app..."),
                                      trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Stack(
                                                children: <Widget>[
                                                  const Align(
                                                    alignment: Alignment.center,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeAlign: 2,
                                                      strokeWidth: 2,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Text("7 m")
                                          ]))),
                              Card(
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      leading: const Card(
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title: const Text("Operation Build App"),
                                      subtitle: const Text(
                                          "I want to build my very own app..."),
                                      trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Stack(
                                                children: <Widget>[
                                                  const Align(
                                                    alignment: Alignment.center,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeAlign: 2,
                                                      strokeWidth: 2,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Text("7 m")
                                          ]))),
                              Card(
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      leading: const Card(
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title: const Text("Operation Build App"),
                                      subtitle: const Text(
                                          "I want to build my very own app..."),
                                      trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Stack(
                                                children: <Widget>[
                                                  const Align(
                                                    alignment: Alignment.center,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeAlign: 2,
                                                      strokeWidth: 2,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Text("7 m")
                                          ]))),
                            ]))))));
  }
}
