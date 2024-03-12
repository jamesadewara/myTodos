import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/view/custom_widgets/notificator.dart';
import 'package:mytodo/src/view/custom_widgets/pickers.dart';
import 'package:mytodo/src/view/custom_widgets/dropdown_modal.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:easy_localization/easy_localization.dart';

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

  List<TaskAdditionalDetail> additionalTaskDetails = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(context.tr("addTaskTitle")),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              DropdownField(
                                  title: taskDepartments.first.title,
                                  subtitle:
                                      taskDepartments.first.subtitle ?? "",
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
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return DropdownModal(
                                              options: taskDepartments,
                                              onSelected: () {});
                                        });
                                  }),
                              const SizedBox(
                                height: 16,
                              ),
                              ListTile(
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return InputModal(
                                          title:
                                              context.tr("editProjectNameText"),
                                          hintText:
                                              context.tr("editProjectNameHint"),
                                          inputType: TextInputType.text,
                                          maxLength: 255,
                                          maxLines: 1,
                                        );
                                      });
                                },
                                title: Text(context.tr("projectNameText")),
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
                              const SizedBox(
                                height: 16,
                              ),
                              ListTile(
                                tileColor:
                                    Theme.of(context).colorScheme.surface,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onTap: () {
                                  GoRouter.of(context)
                                      .pushNamed(AppRoutes.editor);
                                },
                                title:
                                    Text(context.tr("projectDescriptionText")),
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
                              const SizedBox(
                                height: 16,
                              ),
                              DropdownField(
                                  title: context.tr("projectRemindMeText"),
                                  subtitle: "",
                                  leading: const Icon(
                                    Icons.alarm,
                                  ),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const DateTimePicker();
                                        });
                                  }),
                              const SizedBox(
                                height: 16,
                              ),
                              DropdownField(
                                  title: context.tr("projectAddDueDateText"),
                                  subtitle: "",
                                  leading: const Icon(
                                    Icons.calendar_today,
                                  ),
                                  onTap: () {
                                    selectDate(context);
                                  }),
                              SizedBox(
                                height: 16,
                              ),
                              DropdownField(
                                  title: context.tr("repeatText"),
                                  subtitle: "",
                                  leading: const Icon(Icons.repeat),
                                  onTap: () {
                                    selectDateRange(context);
                                  }),
                              const SizedBox(
                                height: 16,
                              ),
                              Column(
                                children: additionalTaskDetails.map((e) {
                                  return Column(children: [
                                    ListTile(
                                      trailing: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {},
                                      ),
                                      tileColor:
                                          Theme.of(context).colorScheme.surface,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      title: Text(e.title),
                                      titleTextStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      subtitle: Text(
                                        e.subtitle,
                                      ),
                                      subtitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    )
                                  ]);
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const TaskInputModal();
                                      });
                                  setState(() {
                                    additionalTaskDetails.add(
                                        TaskAdditionalDetail(
                                            title: "Amazing",
                                            subtitle: "subtitle"));
                                  });
                                },
                                child: Text(context.tr("additionalAddTaskText",
                                    namedArgs: {"value": "+"})),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                            ]))))));
  }
}
