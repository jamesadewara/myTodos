import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:mytodo/src/view/custom_widgets/notificator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BrowseTasksScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const BrowseTasksScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

  @override
  State<BrowseTasksScreen> createState() => _BrowseTasksScreenState();
}

class _BrowseTasksScreenState extends State<BrowseTasksScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollControllerReceiver = ScrollController();

    @override
    void initState() {
      super.initState();
    }

    return AppNavigationBar(
      currentState: 2,
      hideAppBar: true,
      automaticallyImplyLeading: false,
      title: const Text(
        "Adewara James",
        softWrap: true,
      ),
      scrollController: scrollControllerReceiver,
      child: BrowseTasksPage(
        onScroll: (ScrollController value) {
          setState(() {
            scrollControllerReceiver = value;
          });
        },
      ),
    );
  }
}

class BrowseTasksPage extends StatefulWidget {
  final Function(ScrollController) onScroll;
  const BrowseTasksPage({
    super.key,
    required this.onScroll,
  });

  @override
  State<BrowseTasksPage> createState() => _BrowseTasksPageState();
}

class _BrowseTasksPageState extends State<BrowseTasksPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<TaskProps> taskList = [
    TaskProps(name: "Task 1", description: "Description for Task 1"),
    TaskProps(name: "Task 2", description: "Description for Task 2"),
    TaskProps(name: "Task 3", description: "Description for Task 3"),
    TaskProps(name: "Task 3", description: "Description for Task 3"),
    TaskProps(name: "Task 3", description: "Description for Task 3"),
    TaskProps(name: "Task 3", description: "Description for Task 3"),
    TaskProps(name: "Task 3", description: "Description for Task 3"),
    TaskProps(name: "Task 3", description: "Description for Task 3"),
    TaskProps(name: "Task 3", description: "Description for Task 3"),
    TaskProps(name: "Task 3", description: "Description for Task 3"),
    // Add more tasks as needed
  ];

  bool hideAppBar = true;

  @override
  void initState() {
    hideAppBar = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scrollbar(
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
          widget.onScroll(_scrollController);
          return notification.depth == 0;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                    ? 8
                    : 72,
                right: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                    ? 8
                    : 72,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 16),
                  hideAppBar
                      ? Center(child: searchBarWidget())
                      : const Center(),
                  const SizedBox(height: 16),
                  AutoSizeText(
                    context
                        .tr("resultText", namedArgs: {"value": 0.toString()}),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelLarge,
                    softWrap: true,
                  ),

                  const SizedBox(height: 32),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        20, // Replace with the number of viewed tasks
                        (index) {
                          // Replace with appropriate task details
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 120,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Card(
                                        color: Colors.green,
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(Icons.wysiwyg),
                                        )),
                                    ListTile(
                                      title: AutoSizeText(
                                        "Viewed Task $index",
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        softWrap: true,
                                      ),
                                      subtitle: AutoSizeText(
                                        "Description for Viewed Task $index",
                                        maxLines: 3,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        softWrap: true,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Display recent tasks using ListTile with vertical scrolling
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20, // Replace with the number of recent tasks
                    itemBuilder: (context, index) {
                      // Replace with appropriate task details
                      return ListTile(
                        title: Text(
                          "Recent Task $index",
                          softWrap: true,
                        ),
                        leading: const Icon(Icons.history),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {},
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed(AppRoutes.task);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  // Display viewed tasks using horizontal scrolling cards
                ],
              ),
            ),
          ),
        ),
      ),
      hideAppBar
          ? const Center()
          : Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: searchBarWidget(),
              ))
    ]);
  }

  Widget searchBarWidget() {
    return SearchBar(
      controller: _searchController,
      constraints: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
          ? const BoxConstraints(maxWidth: 280)
          : null,
      elevation: MaterialStateProperty.all(2),
      hintText: context.tr("searchTaskText"),
      hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
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
      shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      )),
    );
  }
}
