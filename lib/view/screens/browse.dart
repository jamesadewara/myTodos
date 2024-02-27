import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:mytodo/view/components/notificator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({
    super.key,
  });

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppNavigationBar(
        currentState: 2,
        child: SafeArea(
          child: BrowsePage(),
        ));
  }
}

class BrowsePage extends StatefulWidget {
  const BrowsePage({
    super.key,
  });

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  final _scrollController = ScrollController();
  bool hideAppBar = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    hideAppBar = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hideAppBar
            ? null
            : AppBar(
                automaticallyImplyLeading: false,
                title: SearchBar(
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
                      )
                    ],
                    onChanged: (String value) {},
                    shape: MaterialStateProperty.all(
                        const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ))),
                actions: const <Widget>[NotificatorButton()],
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
                              Center(
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
                                      const NotificatorButton()
                                    ],
                                    onChanged: (String value) {},
                                    shape: MaterialStateProperty.all(
                                        const ContinuousRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ))),
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
                                      leading: const Card(
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title: const Text("Facebook"),
                                      trailing: Switch(
                                        value: true,
                                        onChanged: (bool value) {},
                                      ))),
                              Card(
                                  child: ListTile(
                                      leading: const Card(
                                        child: Icon(
                                          Icons.whatshot_sharp,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title: const Text("Whatshot"),
                                      trailing: Switch(
                                        value: true,
                                        onChanged: (bool value) {},
                                      ))),
                              Card(
                                  child: ListTile(
                                      leading: const Card(
                                        child: Icon(
                                          Icons.snapchat_sharp,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      title: const Text("Snapchat"),
                                      trailing: Switch(
                                        value: true,
                                        onChanged: (bool value) {},
                                      ))),
                            ]))))));
  }
}
