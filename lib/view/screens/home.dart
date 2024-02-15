import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/config.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:mytodo/view/components/circular_prorgess.dart';
import 'package:mytodo/view/components/notificator.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppNavigationBar(
        currentState: 0,
        child: SafeArea(
          child: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  bool hideAppBar = true;

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
                title: const Text("Adewara James"),
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
                              ListTile(
                                  leading: SizedBox(
                                    child: CachedNetworkImage(
                                      imageUrl: profileImg,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          Center(
                                              child: CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress)),
                                      errorWidget: (context, url, error) =>
                                          const Card(
                                              child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.person,
                                          size: 16,
                                        ),
                                      )),
                                    ),
                                  ),
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
                                  trailing: const NotificatorButton()),
                              Stack(
                                children: [
                                  Container(
                                      margin: ResponsiveBreakpoints.of(context)
                                              .between(MOBILE, TABLET)
                                          ? null
                                          : const EdgeInsets.only(right: 160),
                                      height: 160,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 8,
                                            bottom: 24),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      "Your today's task almost done!",
                                                      wrapWords: true,
                                                      softWrap: true,
                                                      maxLines: 2,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.more_horiz,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {},
                                                  )
                                                ],
                                              ),
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStatePropertyAll(
                                                            Theme.of(context)
                                                                .primaryColor),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            Colors.white),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text("Continue"))
                                            ]),
                                      )),
                                  Positioned(
                                    top: ResponsiveBreakpoints.of(context)
                                            .between(MOBILE, TABLET)
                                        ? 50
                                        : 45,
                                    right: ResponsiveBreakpoints.of(context)
                                            .between(MOBILE, TABLET)
                                        ? 10
                                        : 130,
                                    child: Container(
                                        width: 84,
                                        height: 84,
                                        decoration: BoxDecoration(
                                            color: ResponsiveBreakpoints.of(
                                                        context)
                                                    .between(MOBILE, TABLET)
                                                ? null
                                                : Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: CustomCircularProgressIndicator(
                                          color:
                                              !ResponsiveBreakpoints.of(context)
                                                      .between(MOBILE, TABLET)
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.white,
                                          textColor:
                                              !ResponsiveBreakpoints.of(context)
                                                      .between(MOBILE, TABLET)
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .onSurface
                                                  : Colors.white,
                                          strokeAlign: 8,
                                          strokeWidth: 4,
                                          value: .55,
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 120,
                                          width: 220,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
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
                                                            .bodySmall
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      const Card(
                                                          color: Colors
                                                              .lightBlueAccent,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            child: Icon(
                                                              Icons.wysiwyg,
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
                                                                      .bold,
                                                              color: Colors
                                                                  .white)),
                                                  LinearProgressIndicator(
                                                    value: 0.75,
                                                    color: Colors.lightBlue,
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
                                              color: Colors.deepOrange,
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
                                                            .bodySmall
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      const Card(
                                                          color: Colors
                                                              .orangeAccent,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            child: Icon(
                                                              Icons.person,
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
                                                                      .bold,
                                                              color: Colors
                                                                  .white)),
                                                  LinearProgressIndicator(
                                                    value: 0.75,
                                                    color: Colors.orange,
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
                              ListTile(
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.taskGroup);
                                },
                                leading: const Card(
                                    color: Colors.orangeAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Personal Project"),
                                titleTextStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                subtitle: const Text("30 Tasks"),
                                trailing: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CustomCircularProgressIndicator(
                                      color: Theme.of(context).primaryColor,
                                      textColor: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      strokeAlign: 4,
                                      strokeWidth: 4,
                                      value: .55,
                                    )),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListTile(
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.taskGroup);
                                },
                                leading: const Card(
                                    color: Colors.orangeAccent,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.person,
                                        size: 16,
                                      ),
                                    )),
                                title: const Text("Personal Project"),
                                titleTextStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                subtitle: const Text("30 Tasks"),
                                trailing: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CustomCircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                    textColor:
                                        Theme.of(context).colorScheme.onSurface,
                                    strokeAlign: 4,
                                    strokeWidth: 4,
                                    value: .55,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListTile(
                                  tileColor:
                                      Theme.of(context).colorScheme.surface,
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.taskGroup);
                                  },
                                  leading: const Card(
                                      color: Colors.orangeAccent,
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.person,
                                          size: 16,
                                        ),
                                      )),
                                  title: const Text("Personal Project"),
                                  titleTextStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  subtitle: const Text("30 Tasks"),
                                  trailing: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CustomCircularProgressIndicator(
                                        color: Theme.of(context).primaryColor,
                                        textColor: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        strokeAlign: 4,
                                        strokeWidth: 4,
                                        value: null,
                                      ))),
                              const SizedBox(
                                height: 48,
                              ),
                            ]))))));
  }
}
