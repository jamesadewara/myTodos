import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class AccountManagementScreen extends StatefulWidget {
  const AccountManagementScreen({
    super.key,
  });

  @override
  State<AccountManagementScreen> createState() =>
      _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppNavigationBar(
        currentState: 3,
        child: SafeArea(
          child: AccountManagementPage(),
        ));
  }
}

class AccountManagementPage extends StatefulWidget {
  const AccountManagementPage({
    super.key,
  });

  @override
  State<AccountManagementPage> createState() => _AccountManagementPageState();
}

class _AccountManagementPageState extends State<AccountManagementPage> {
  final PageController _viewController = PageController();
  final appBarTitles = [
    "Account Management",
    "Deactivate Account",
    "Delete Account"
  ];

  final int currentView = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: _viewController.initialPage != 0
                ? BackButton(
                    onPressed: () {
                      _viewController.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                  )
                : null,
            title: Text(_viewController.initialPage == 0
                ? appBarTitles[0]
                : _viewController.initialPage == 2
                    ? appBarTitles[1]
                    : appBarTitles[2])),
        body: PageView(
          controller: _viewController,
          children: [
            FirstPageView(
              changeView: () {
                setState(() {
                  _viewController.nextPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear);
                });
              },
            ),
            SecondPageView(
              changeView: () {
                setState(() {
                  _viewController.nextPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear);
                });
              },
            ),
            ThirdPageView(
              changeView: () {
                setState(() {
                  _viewController.nextPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear);
                });
              },
            ),
            FourthPageView(
              changeView: () {
                setState(() {
                  _viewController.nextPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear);
                });
              },
            ),
          ],
        ));
  }
}

class FirstPageView extends StatefulWidget {
  final VoidCallback changeView;
  const FirstPageView({super.key, required this.changeView});

  @override
  State<FirstPageView> createState() => _FirstPageViewState();
}

class _FirstPageViewState extends State<FirstPageView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              AutoSizeText(
                                  "Deactivating or deleting your myTodo's account",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              AutoSizeText(
                                  "If you want to temporarily close your account, you can deactivate it. If you want to permanently remove your data from myTodo, you can delete your account.",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              const SizedBox(height: 24),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: true,
                                ),
                                title: const Text("Deactivate account"),
                                titleTextStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                subtitle: const Text(
                                    "Deactivating your account is reversible, Your profile and tasks won't be shown on myTodo's. You will be able to reactivate your account"),
                              )),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: const Text("Delete account"),
                                titleTextStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                subtitle: const Text(
                                    "Deleting your account is permanent and irreversible. You won't be able to retrieve the files or information from your orders on myTodo's"),
                              )),
                              const SizedBox(
                                height: 48,
                              ),
                              Center(
                                child: FilledButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: widget.changeView,
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: Text("Continue"),
                                    )),
                              ),
                              const SizedBox(height: 48),
                            ]))))));
  }
}

class SecondPageView extends StatefulWidget {
  final VoidCallback changeView;
  const SecondPageView({super.key, required this.changeView});

  @override
  State<SecondPageView> createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              AutoSizeText(
                                  "Interested in deactivating your myTodo's account?",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              AutoSizeText(
                                  "Here's what you need to know about the process",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              const SizedBox(height: 8),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 8,
                                ),
                                title: const Text(
                                    "Your profile disappers from myTodo's"),
                                titleTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 8,
                                ),
                                title: const Text(
                                    "Any email addresses linked to this account can't be used for future accounts."),
                                titleTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 8,
                                ),
                                title: const Text(
                                    "Closing your account doesn't automatically erase its information."),
                                titleTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 24),
                              AutoSizeText(
                                  "Need to reactivte? Just email us at myTodo@myTodo.com",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 48,
                              ),
                              Center(
                                child: FilledButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: widget.changeView,
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: Text(
                                          "Continue to account deactivation"),
                                    )),
                              ),
                              const SizedBox(height: 48),
                            ]))))));
  }
}

class ThirdPageView extends StatefulWidget {
  final VoidCallback changeView;
  const ThirdPageView({super.key, required this.changeView});

  @override
  State<ThirdPageView> createState() => _ThirdPageViewState();
}

class _ThirdPageViewState extends State<ThirdPageView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              AutoSizeText("I'm leaving because",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: const Text(
                                    "I'm unhappy with myTodo's policies"),
                              )),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: const Text(
                                    "myTodo's applications is/are to complicated or hard to use"),
                              )),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: const Text("Other"),
                              )),
                              const SizedBox(
                                height: 48,
                              ),
                              Center(
                                child: FilledButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: widget.changeView,
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: Text("Delete Account"),
                                    )),
                              ),
                              const SizedBox(height: 48),
                            ]))))));
  }
}

class FourthPageView extends StatefulWidget {
  final VoidCallback changeView;
  const FourthPageView({super.key, required this.changeView});

  @override
  State<FourthPageView> createState() => _FourthPageViewState();
}

class _FourthPageViewState extends State<FourthPageView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              AutoSizeText("I'm leaving because",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: const Text(
                                    "I'm unhappy with myTodo's policies"),
                              )),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: const Text(
                                    "myTodo's applications is/are to complicated or hard to use"),
                              )),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: const Text("Other"),
                              )),
                              const SizedBox(
                                height: 48,
                              ),
                              Center(
                                child: FilledButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: widget.changeView,
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: Text("Deactivate Account"),
                                    )),
                              ),
                              const SizedBox(height: 48),
                            ]))))));
  }
}
