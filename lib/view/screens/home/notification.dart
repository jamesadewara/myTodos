import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _scrollController = ScrollController();
  bool hideAppBar = true;
  List<int> selectedNotifications = [];
  List<Map<String, dynamic>> filteredNotificationsList = [];
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
    super.initState();
    filteredNotificationsList = List.from(notificationsList);
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
                  GoRouter.of(context).pop(true);
                },
              ),
        title: Text(selectedNotifications.isNotEmpty
            ? AppLocalizations.of(context)!
                .selectedText(selectedNotifications.length)
            : AppLocalizations.of(context)!.notificationTitle),
        actions: <Widget>[
          Visibility(
            visible: selectedNotifications.isNotEmpty,
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _deleteSelectedNotifications();
              },
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              _filterNotifications(value);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'All',
                child: Text('All'),
              ),
              const PopupMenuItem<String>(
                value: 'Payment',
                child: Text('Payment'),
              ),
              const PopupMenuItem<String>(
                value: 'Meeting',
                child: Text('Meeting'),
              ),
              // Add more filters as needed
            ],
          ),
        ],
      ),
      body: ListView.separated(
        controller: _scrollController,
        itemCount: filteredNotificationsList.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 16),
        itemBuilder: (BuildContext context, int index) {
          final isSelected = selectedNotifications.contains(index);
          return Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                    ? 8
                    : 72,
                right: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                    ? 8
                    : 72,
              ),
              child: ListTile(
                tileColor: isSelected
                    ? Colors.grey.withOpacity(0.5)
                    : Theme.of(context).colorScheme.surface,
                onTap: () {
                  setState(() {
                    if (selectedNotifications.contains(index)) {
                      selectedNotifications.remove(index);
                    } else {
                      selectedNotifications.add(index);
                    }
                  });
                },
                onLongPress: () {
                  if (selectedNotifications.isEmpty) {
                    setState(() {
                      selectedNotifications.add(index);
                    });
                  }
                },
                leading: const Card(
                  color: Colors.purple,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.person,
                      size: 16,
                    ),
                  ),
                ),
                title: Text(filteredNotificationsList[index]["title"]),
                subtitle: Text(filteredNotificationsList[index]["subtitle"]),
                trailing: selectedNotifications.isNotEmpty
                    ? Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedNotifications.add(index);
                            } else {
                              selectedNotifications.remove(index);
                            }
                          });
                        },
                      )
                    : const Icon(Icons.email),
              ),
            ),
          );
        },
      ),
    );
  }

  void _deleteSelectedNotifications() {
    setState(() {
      selectedNotifications.sort((a, b) => b.compareTo(a));
      for (int index in selectedNotifications) {
        notificationsList.removeAt(index);
      }
      selectedNotifications.clear();
      filteredNotificationsList = List.from(notificationsList);
    });
  }

  void _filterNotifications(String value) {
    setState(() {
      switch (value) {
        case 'Payment':
          filteredNotificationsList = notificationsList
              .where((notification) =>
                  notification['title'].toString().contains('Payment'))
              .toList();
          break;
        case 'Meeting':
          filteredNotificationsList = notificationsList
              .where((notification) =>
                  notification['title'].toString().contains('Meeting'))
              .toList();
          break;
        default:
          filteredNotificationsList = List.from(notificationsList);
      }
    });
  }
}
