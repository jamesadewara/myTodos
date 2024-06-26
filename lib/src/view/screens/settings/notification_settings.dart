import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NotificationSettingsScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const NotificationSettingsScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
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
    return AppNavigationBar(
        currentState: 3,
        automaticallyImplyLeading: false,
        title: Text(
          context.tr("settingsNotificationTitle"),
          softWrap: true,
        ),
        child: const SafeArea(
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
    return Scrollbar(
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
                          AutoSizeText(
                            context.tr("settingsPushNotificationTitle"),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                          const SizedBox(height: 8),
                          ListTile(
                              tileColor: Theme.of(context).colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              title: const Text(
                                "My account",
                                softWrap: true,
                              ),
                              trailing: Switch(
                                value: true,
                                onChanged: (bool value) {},
                              )),
                          const SizedBox(height: 24),
                          AutoSizeText(
                            context.tr("settingsEmailNotificationTitle"),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                          const SizedBox(height: 8),
                          ListTile(
                              tileColor: Theme.of(context).colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              title: const Text(
                                "Inbox messages",
                                softWrap: true,
                              ),
                              trailing: Switch(
                                value: true,
                                onChanged: (bool value) {},
                              )),
                          const SizedBox(height: 32),
                          ListTile(
                              tileColor: Theme.of(context).colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onTap: () {},
                              title: Text(
                                context.tr("settingsNotificationSoundTitle"),
                                softWrap: true,
                              ),
                              trailing: const Icon(Icons.chevron_right)),
                          const SizedBox(height: 48),
                        ])))));
  }
}
