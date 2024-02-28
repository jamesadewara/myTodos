import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:mytodo/view/components/notificator.dart';
import 'package:mytodo/view/components/profile_img.dart';
import 'package:mytodo/view/screens/settings/profile.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppNavigationBar(
        currentState: 3,
        child: SafeArea(
          child: SettingsPage(),
        ));
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: hideAppBar ? null : const Text("Adewara James"),
            actions: const [NotificatorButton()]),
        body: Scrollbar(
            controller: _scrollController,
            interactive: true,
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
            child: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? settingsView()
                : desktopSettingsView()));
  }

  Widget desktopSettingsView() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 128,
          ),
          const ProfilePage(
            isDesktop: true,
          ),
          Expanded(child: settingsView()),
        ]);
  }

  Widget settingsView() {
    return SingleChildScrollView(
        controller: _scrollController,
        // physics: const NeverScrollableScrollPhysics(),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Visibility(
                visible:
                    ResponsiveBreakpoints.of(context).between(MOBILE, TABLET),
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: ListTile(
                        leading: const SizedBox(
                          width: 64,
                          height: 64,
                          child: ProfileImage(image: "", size: 48),
                        ),
                        title: Text(
                          "Adewara James",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Adewara James",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    )),
              ),
              Padding(
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
                        const SizedBox(
                          height: 48,
                        ),
                        AutoSizeText("Account",
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 8,
                        ),
                        Visibility(
                          visible: ResponsiveBreakpoints.of(context)
                              .between(MOBILE, TABLET),
                          child: ListTile(
                              tileColor: Theme.of(context).colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.profile);
                              },
                              leading: const Card(
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.person),
                                ),
                              ),
                              title: const Text("My Profile"),
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              trailing: const Icon(Icons.chevron_right)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ListTile(
                            tileColor: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onTap: () {},
                            leading: const Card(
                                child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.refresh),
                            )),
                            title: const Text("Reset Account"),
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            trailing: const Icon(Icons.chevron_right)),
                        const SizedBox(
                          height: 12,
                        ),
                        ListTile(
                            tileColor: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.accountManagement);
                            },
                            leading: const Card(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.delete_outline),
                              ),
                            ),
                            title: const Text("Account management"),
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            trailing: const Icon(Icons.chevron_right)),
                        const SizedBox(
                          height: 12,
                        ),
                        ListTile(
                            tileColor: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onTap: () {
                              AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                title: const Text('Login Dialog'),
                                content: const Text(
                                    'Are you sure you want to logout?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                            leading: const Card(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.logout),
                              ),
                            ),
                            title: const Text("Logout"),
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            trailing: const Icon(Icons.chevron_right)),
                        const SizedBox(
                          height: 32,
                        ),
                        AutoSizeText("Preferences",
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 8,
                        ),
                        ListTile(
                            tileColor: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.appNotification);
                            },
                            leading: const Card(
                                child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.notifications_none),
                            )),
                            title: const Text("Notifications"),
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            trailing: const Icon(Icons.chevron_right)),
                        const SizedBox(
                          height: 12,
                        ),
                        ListTile(
                            tileColor: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.appAppearances);
                            },
                            leading: const Card(
                                child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.palette),
                            )),
                            title: const Text("Appearance"),
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            trailing: const Icon(Icons.chevron_right)),
                        const SizedBox(
                          height: 12,
                        ),
                        ListTile(
                            tileColor: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.appLanguages);
                            },
                            leading: const Card(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.language),
                              ),
                            ),
                            title: const Text("Language"),
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            trailing: const Icon(Icons.chevron_right)),
                        const SizedBox(
                          height: 12,
                        ),
                        ListTile(
                          tileColor: Theme.of(context).colorScheme.surface,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onTap: () {},
                          title: const Text("Feedback us"),
                          titleTextStyle: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ListTile(
                            tileColor: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onTap: () {
                              showAboutDialog(context: context);
                            },
                            title: const Text("App Version"),
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            trailing: const Text("1.0.0")),
                        const SizedBox(
                          height: 12,
                        ),
                      ]))
            ])));
  }
}