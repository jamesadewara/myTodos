import 'package:flutter/material.dart';
// import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const NotificationPage();
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
  });

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _scrollController = ScrollController();
  bool hideAppBar = true;
  List selectedNotifications = [];
  final List<Map<String, dynamic>> notificationsList = [
    {"title": "Email Verification", "subtitle": "Your email has been verified"},
    {"title": "Todo Created", "subtitle": "Your todo account has been created"},
    {
      "title": "Meeting Reminder",
      "subtitle": "Don't forget the meeting at 3 PM"
    },
    {"title": "New Message", "subtitle": "You have a new message from John"},
    {
      "title": "Payment Received",
      "subtitle": "You've received a payment of \$100"
    },
    {
      "title": "Flight Update",
      "subtitle": "Your flight has been delayed by 1 hour"
    },
    {
      "title": "Task Assigned",
      "subtitle": "A new task has been assigned to you"
    },
  ];

  @override
  void initState() {
    hideAppBar = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: selectedNotifications.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        selectedNotifications.clear();
                      });
                    },
                  )
                : BackButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
            title: Text(selectedNotifications.isNotEmpty
                ? "${selectedNotifications.length} selected"
                : "Notifications"),
            actions: <Widget>[
              Visibility(
                visible: selectedNotifications.isNotEmpty,
                child: Radio(
                    value:
                        selectedNotifications.length == notificationsList.length
                            ? true
                            : false,
                    groupValue: true,
                    onChanged: (value) {
                      selectedNotifications.length == notificationsList.length
                          ? setState(() {
                              selectedNotifications.clear();
                            })
                          : setState(() {
                              for (var element in notificationsList) {
                                if (selectedNotifications.contains(
                                    notificationsList.indexOf(element))) {
                                } else {
                                  selectedNotifications
                                      .add(notificationsList.indexOf(element));
                                }
                              }
                            });
                    }),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    try {
                      selectedNotifications.isEmpty
                          ? notificationsList.clear()
                          : {
                              selectedNotifications.map((e) {
                                return notificationsList.removeAt(e);
                              }),
                              selectedNotifications.clear()
                            };
                    } catch (e) {
                      selectedNotifications.clear();
                    }
                  });
                },
              ),
            ]),
        body: ListView.separated(
          controller: _scrollController,
          itemCount: notificationsList.length,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 16),
          itemBuilder: (BuildContext context, int index) {
            return Center(
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
                    child: ListTile(
                        tileColor: Theme.of(context).colorScheme.surface,
                        onTap: () {
                          selectedNotifications.isNotEmpty
                              ? selectedNotifications.contains(index)
                                  ? setState(() {
                                      selectedNotifications.remove(index);
                                    })
                                  : setState(() {
                                      selectedNotifications.add(index);
                                    })
                              : null;
                        },
                        onLongPress: () {
                          selectedNotifications.isNotEmpty
                              ? null
                              : setState(() {
                                  selectedNotifications.add(index);
                                });
                        },
                        leading: const Card(
                            color: Colors.purple,
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.person,
                                size: 16,
                              ),
                            )),
                        title: Text(notificationsList[index]["title"]),
                        subtitle: Text(notificationsList[index]["subtitle"]),
                        trailing:
                            selectedNotifications.isNotEmpty
                                ? Radio(
                                    value: selectedNotifications.contains(index)
                                        ? true
                                        : false,
                                    groupValue: true,
                                    onChanged: (value) {})
                                : const Icon(Icons.email))));
          },
        ));
  }
}
