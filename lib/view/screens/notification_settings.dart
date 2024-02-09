import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({
    super.key,
  });

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppNavigationBar(
        currentState: 3,
        child: SafeArea(
          child: NotificationSettingsPage(),
        ));
  }
}

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({
    super.key,
  });

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Notifications")),
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
                              const SizedBox(height: 16),
                              AutoSizeText("Push notifications",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                      title: const Text("Inbox messages"),
                                      trailing: Switch(
                                        value: true,
                                        onChanged: (bool value) {},
                                      ))),
                              Card(
                                  child: ListTile(
                                      title: const Text("My account"),
                                      trailing: Switch(
                                        value: true,
                                        onChanged: (bool value) {},
                                      ))),
                              const SizedBox(height: 24),
                              AutoSizeText("Email notifications",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                      title: const Text("Inbox messages"),
                                      trailing: Switch(
                                        value: true,
                                        onChanged: (bool value) {},
                                      ))),
                              const SizedBox(height: 32),
                              Card(
                                  child: ListTile(
                                      onTap: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      title: const Text("Notifications sound"),
                                      trailing:
                                          const Icon(Icons.chevron_right))),
                              const SizedBox(height: 48),
                            ]))))));
  }
}
