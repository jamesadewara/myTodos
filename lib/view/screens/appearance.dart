import 'package:flutter/material.dart';
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 16),
                              Card(
                                child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    title: const Text("System Theme"),
                                    trailing: Radio(
                                        value: true,
                                        groupValue: null,
                                        onChanged: (value) {})),
                              ),
                              Card(
                                child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    title: const Text("Light Mode Theme"),
                                    trailing: Radio(
                                        value: true,
                                        groupValue: null,
                                        onChanged: (value) {})),
                              ),
                              Card(
                                child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    title: const Text("Dark Mode Theme"),
                                    trailing: Radio(
                                        value: true,
                                        groupValue: null,
                                        onChanged: (value) {})),
                              ),
                            ]))))));
  }
}
