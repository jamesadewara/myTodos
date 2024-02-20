import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/view/components/notificator.dart';
import 'package:mytodo/view/components/pickers.dart';
import 'package:mytodo/view/screens/dropdown_modal.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _scrollController = ScrollController();

  List<DropdownModalController> taskDepartments = [
    const DropdownModalController(
        title: "Church", subtitle: "This is for church activities"),
    const DropdownModalController(title: "Work", subtitle: ""),
    const DropdownModalController(title: "School", subtitle: "")
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Project"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
            const NotificatorButton(),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Card(
                                child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    onTap: () {},
                                    leading: Card(
                                        child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: CachedNetworkImage(
                                        width: 24,
                                        height: 24,
                                        imageUrl:
                                            taskDepartments.first.image ?? "",
                                      ),
                                    )),
                                    title: Text(taskDepartments.first.title),
                                    subtitle: Text(
                                      taskDepartments.first.subtitle ?? "",
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return DropdownModal(
                                                onSelected: () {},
                                                options: taskDepartments,
                                              );
                                            });
                                      },
                                    )),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Card(
                                child: ListTile(
                                  title: const Text("Project Name"),
                                  titleTextStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  subtitle: const Text(
                                    "Grocery Shopping App",
                                  ),
                                  subtitleTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Card(
                                child: ListTile(
                                  title: const Text("Description"),
                                  titleTextStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  subtitle: const Text(
                                    "This software caters to super shops, presenting a centralized hub where they can effectively showcase and deliver thier entire product range. Customers gain access to a convienient all-in-one solution for thier day-to-day shopping necessities",
                                  ),
                                  subtitleTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Card(
                                child: ListTile(
                                    leading: Card(
                                        child: Icon(
                                      Icons.calendar_today,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )),
                                    title: const Text("Start Date"),
                                    titleTextStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                    subtitle: const Text(
                                      "01 May, 2022",
                                    ),
                                    subtitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        selectDate(context);
                                      },
                                    )),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Card(
                                child: ListTile(
                                    leading: Card(
                                        child: Icon(
                                      Icons.calendar_today,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )),
                                    title: const Text("End Date"),
                                    titleTextStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                    subtitle: const Text(
                                      "30 June, 2022",
                                    ),
                                    subtitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        selectTime(context);
                                      },
                                    )),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Card(
                                child: ListTile(
                                    leading: const Card(
                                        child: Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                    )),
                                    title: const Text("Grocery"),
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            color: const Color(0xFF1B461C)),
                                    subtitle: const Text(
                                      "01 May, 2022",
                                    ),
                                    subtitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF992C24)),
                                    trailing: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Continue"),
                                    )),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("Add additional details +"),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              Center(
                                child: FilledButton(
                                    onPressed: () async {},
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: Text("Save Task"),
                                    )),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                            ]))))));
  }
}
