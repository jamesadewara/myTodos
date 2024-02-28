import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/store.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({
    super.key,
  });

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppNavigationBar(
        currentState: 3,
        child: SafeArea(
          child: AppearancePage(),
        ));
  }
}

class AppearancePage extends StatefulWidget {
  const AppearancePage({
    super.key,
  });

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  final _scrollController = ScrollController();
  final List<Map<String, String>> themeList = [
    {"id": "system", "value": "System Theme"},
    {"id": "light", "value": "Light Mode Theme"},
    {"id": "dark", "value": "Dark Mode Theme"}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("App Appearance")),
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
                        child: StoreConnector<AppState, String>(
                            converter: (store) => store.state.theme ?? "system",
                            builder: (context, currentTheme) {
                              return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: themeList.map((e) {
                                    return Column(
                                      children: [
                                        const SizedBox(height: 8),
                                        ListTile(
                                            onTap: () {
                                              AppState(theme: e["id"]);
                                            },
                                            tileColor: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            title: Text(e["value"]!),
                                            trailing: Radio(
                                                value: currentTheme == e["id"],
                                                groupValue:
                                                    currentTheme == e["id"],
                                                onChanged: (value) {
                                                  print(value);
                                                  AppState(theme: e["id"]);
                                                })),
                                      ],
                                    );
                                  }).toList());
                            }))))));
  }
}
