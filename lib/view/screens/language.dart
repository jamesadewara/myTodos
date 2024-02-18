import 'package:flutter/material.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({
    super.key,
  });

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppNavigationBar(
        currentState: 3,
        child: SafeArea(
          child: LanguagePage(),
        ));
  }
}

class LanguagePage extends StatefulWidget {
  const LanguagePage({
    super.key,
  });

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
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
            title: const Text("App Language")),
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
                                    onTap: () {},
                                    title: const Text("English"),
                                    subtitle: const Text("English"),
                                    trailing: Icon(
                                      Icons.check,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )),
                              ),
                              Card(
                                  child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onTap: () {},
                                title: const Text("Francais"),
                                subtitle: const Text("French"),
                              )),
                              Card(
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onTap: () {},
                                  title: const Text("Ede Yoruba"),
                                  subtitle: const Text("Yoruba"),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onTap: () {},
                                  title: const Text("Igbo"),
                                  subtitle: const Text("Igbo"),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onTap: () {},
                                  title: const Text("Hausa"),
                                  subtitle: const Text("Hausa"),
                                ),
                              ),
                            ]))))));
  }
}
