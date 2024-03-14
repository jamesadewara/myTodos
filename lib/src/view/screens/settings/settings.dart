import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:mytodo/src/view/custom_widgets/profile_img.dart';
import 'package:mytodo/src/view/screens/settings/profile.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SettingsScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const SettingsScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool hideAppBar = true;

  @override
  void initState() {
    hideAppBar = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppNavigationBar(
        currentState: 3,
        title: const Text(
          "Adewara James",
          softWrap: true,
        ),
        hideBackground:
            ResponsiveBreakpoints.of(context).between(MOBILE, TABLET),
        hideAppBar: hideAppBar,
        child: SafeArea(
          child: SettingsPage(
            onHide: (bool value) {
              setState(() {
                hideAppBar = value;
              });
            },
          ),
        ));
  }
}

class SettingsPage extends StatefulWidget {
  final Function(bool) onHide;

  const SettingsPage({
    super.key,
    required this.onHide,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: _scrollController,
        interactive: true,
        notificationPredicate: (ScrollNotification notification) {
          if (_scrollController.offset > 48) {
            widget.onHide(false);
          } else {
            widget.onHide(true);
          }

          return notification.depth == 0;
        },
        child: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
            ? settingsView()
            : desktopSettingsView());
  }

  Widget desktopSettingsView() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 4,
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
                          softWrap: true,
                        ),
                        subtitle: Text(
                          "Adewara James",
                          style: Theme.of(context).textTheme.bodySmall,
                          softWrap: true,
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
                      children: settingsList(context: context).map((index) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 32,
                              ),
                              AutoSizeText(
                                index.title,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Column(
                                  children: index.children.map((subIndex) {
                                return Column(children: [
                                  Visibility(
                                    visible: subIndex.id == "profile"
                                        ? ResponsiveBreakpoints.of(context)
                                            .between(MOBILE, TABLET)
                                        : true,
                                    child: subIndex.id == "about"
                                        ? AboutListTile(
                                            icon: Icon(
                                              subIndex.icon,
                                            ),
                                            applicationIcon: Image.asset(
                                              "assets/icon.png",
                                              width: 62,
                                              height: 62,
                                            ),
                                            applicationName: appName,
                                            applicationVersion: appVersion,
                                            applicationLegalese: appLegalese,
                                            aboutBoxChildren: const [
                                              Text(
                                                "Thanks for usage",
                                                softWrap: true,
                                              )
                                            ],
                                            child: Text(
                                              subIndex.title,
                                              softWrap: true,
                                            ),
                                          )
                                        : ListTile(
                                            tileColor: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            onTap: subIndex.goRoute,
                                            leading: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Icon(subIndex.icon),
                                              ),
                                            ),
                                            title: Text(
                                              subIndex.title,
                                              softWrap: true,
                                            ),
                                            titleTextStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                            trailing:
                                                Icon(subIndex.trailingIcon)),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  )
                                ]);
                              }).toList())
                            ]);
                      }).toList()))
            ])));
  }
}
