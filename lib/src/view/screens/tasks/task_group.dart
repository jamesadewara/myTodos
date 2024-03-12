import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mytodo/src/model/props/task_props.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TaskGroupScreen extends StatefulWidget {
  const TaskGroupScreen({super.key});

  @override
  State<TaskGroupScreen> createState() => _TaskGroupScreenState();
}

class _TaskGroupScreenState extends State<TaskGroupScreen> {
  final _scrollController = ScrollController();
  bool hideAppBar = true;
  bool isSearchable = false;
  final TextEditingController _searchController = TextEditingController();

  List<TaskProp> taskItems = [
    TaskProp(
        id: "1", title: "Project Alpha", subtitle: "This is project alpha."),
    TaskProp(id: "2", title: "Project Beta", subtitle: "This is project beta."),
    TaskProp(
        id: "3", title: "Project Gamma", subtitle: "This is project gamma."),
    TaskProp(
        id: "4", title: "Project Delta", subtitle: "This is project delta."),
    TaskProp(
        id: "5",
        title: "Project Epsilon",
        subtitle: "This is project epsilon."),
    TaskProp(id: "6", title: "Project Zeta", subtitle: "This is project zeta."),
    TaskProp(id: "7", title: "Project Eta", subtitle: "This is project eta."),
  ];

  List<TaskProp> filteredTaskItems = [];
  List<TaskProp> completedTaskItems = [];

  @override
  void initState() {
    hideAppBar = true;
    isSearchable = false;
    filteredTaskItems = List.from(taskItems);
    super.initState();
  }

  void _filterTaskItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTaskItems = List.from(taskItems);
      } else {
        filteredTaskItems = taskItems
            .where((task) =>
                task.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: !isSearchable,
        title: isSearchable
            ? TextField(
                onChanged: _filterTaskItems,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: context.tr("searchTaskText"),
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _searchController.clear();
                      _filterTaskItems('');
                    },
                  ),
                  border: InputBorder.none,
                ),
              )
            : Text(context.tr("taskProjectTitle")),
        actions: <Widget>[
          isSearchable
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      isSearchable = false;
                      _searchController.clear();
                      _filterTaskItems('');
                    });
                  },
                )
              : hideAppBar
                  ? const Center()
                  : IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          isSearchable = true;
                        });
                      },
                    ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'rename',
                child: Text('Rename List'),
              ),
              const PopupMenuItem<String>(
                value: 'sort',
                child: Text('Sort by'),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('Delete List'),
              ),
              // Add more filters as needed
            ],
          )
        ],
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                        ? 8
                        : 72,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Visibility(
                    visible: !isSearchable,
                    child: Center(
                      child: SearchBar(
                          controller: _searchController,
                          onChanged: _filterTaskItems,
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
                                _filterTaskItems('');
                              },
                            )
                          ],
                          shape: MaterialStateProperty.all(
                              const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Results: ${filteredTaskItems.length}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.tr("resultText",
                        namedArgs: {"value": taskItems.length.toString()}),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 32),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredTaskItems.length,
                    itemBuilder: (context, index) {
                      final task = filteredTaskItems[index];
                      return CheckboxListTile(
                        value: completedTaskItems.contains(task),
                        onChanged: (value) {
                          setState(() {
                            if (completedTaskItems.contains(task)) {
                              completedTaskItems.remove(task);
                            } else {
                              completedTaskItems.add(task);
                            }
                          });
                        },
                        title: Text(
                          task.title,
                          style: TextStyle(
                              decoration: completedTaskItems.contains(task)
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                        subtitle: Text(task.subtitle),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
