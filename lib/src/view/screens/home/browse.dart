import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:mytodo/src/view/custom_widgets/notificator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TaskModel {
  final String name;
  final String description;

  TaskModel({required this.name, required this.description});
}

class BrowseTasksScreen extends StatefulWidget {
  const BrowseTasksScreen({super.key});

  @override
  State<BrowseTasksScreen> createState() => _BrowseTasksScreenState();
}

class _BrowseTasksScreenState extends State<BrowseTasksScreen> {
  List<TaskModel> taskList = [
    TaskModel(name: "Task 1", description: "Description for Task 1"),
    TaskModel(name: "Task 2", description: "Description for Task 2"),
    TaskModel(name: "Task 3", description: "Description for Task 3"),
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return const AppNavigationBar(
      currentState: 2,
      child: SafeArea(
        child: BrowseTasksPage(),
      ),
    );
  }
}

class BrowseTasksPage extends StatefulWidget {
  const BrowseTasksPage({super.key});

  @override
  State<BrowseTasksPage> createState() => _BrowseTasksPageState();
}

class _BrowseTasksPageState extends State<BrowseTasksPage> {
  final ScrollController _scrollController = ScrollController();
  bool hideAppBar = true;
  final TextEditingController _searchController = TextEditingController();

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
                hintText: context.tr("searchTaskText"),
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
                shape:
                    MaterialStateProperty.all(const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                )),
              ),
              actions: const <Widget>[NotificatorButton()],
            ),
      body: Scrollbar(
        controller: _scrollController,
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
                  Center(
                    child: SearchBar(
                      controller: _searchController,
                      constraints: ResponsiveBreakpoints.of(context)
                              .between(MOBILE, TABLET)
                          ? const BoxConstraints(maxWidth: 280)
                          : null,
                      elevation: MaterialStateProperty.all(2),
                      hintText: context.tr("searchTaskText"),
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
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AutoSizeText(
                    context
                        .tr("resultText", namedArgs: {"value": 0.toString()}),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),

                  const SizedBox(height: 32),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5, // Replace with the number of viewed tasks
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
                                      ),
                                      subtitle: AutoSizeText(
                                        "Description for Viewed Task $index",
                                        maxLines: 3,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
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
                    itemCount: 5, // Replace with the number of recent tasks
                    itemBuilder: (context, index) {
                      // Replace with appropriate task details
                      return ListTile(
                        title: Text("Recent Task $index"),
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
    );
  }
}
