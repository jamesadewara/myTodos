import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AccountManagementScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const AccountManagementScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
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

  final int currentView = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBarTitles = [
      context.tr("accountManagementTitle"),
      context.tr("accountDeactivateTitle"),
      context.tr("accountDeleteTitle"),
    ];

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
            title: Text(
              _viewController.initialPage == 0
                  ? appBarTitles[0]
                  : _viewController.initialPage == 2
                      ? appBarTitles[1]
                      : appBarTitles[2],
              softWrap: true,
            )),
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
                                context.tr("accountManagementText",
                                    namedArgs: {"value": appName}),
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
                              const SizedBox(height: 8),
                              AutoSizeText(
                                context.tr("accountManagementCondition",
                                    namedArgs: {"value": appName}),
                                style: Theme.of(context).textTheme.bodyLarge,
                                softWrap: true,
                              ),
                              const SizedBox(height: 24),
                              Card(
                                child: ListTile(
                                    leading: Radio(
                                      value: true,
                                      onChanged: (bool? value) {},
                                      groupValue: true,
                                    ),
                                    title: Text(
                                      context.tr("accountDeactivateTitle"),
                                      softWrap: true,
                                    ),
                                    titleTextStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    subtitle: Text(
                                      context.tr("accountDeactivateInfo",
                                          namedArgs: {"value": appName}),
                                      softWrap: true,
                                    )),
                              ),
                              Card(
                                  child: ListTile(
                                      leading: Radio(
                                        value: true,
                                        onChanged: (bool? value) {},
                                        groupValue: false,
                                      ),
                                      title: Text(
                                        context.tr("accountDeleteTitle"),
                                        softWrap: true,
                                      ),
                                      titleTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      subtitle: Text(
                                        context.tr("accountDeleteWarning",
                                            namedArgs: {"value": appName}),
                                        softWrap: true,
                                      ))),
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
                                        "Continue",
                                        softWrap: true,
                                      ),
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
                                context.tr("accountDeactivateQuestion",
                                    namedArgs: {"value": appName}),
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
                              const SizedBox(height: 8),
                              AutoSizeText(
                                context.tr("accountDeactivateFaqsTitle",
                                    namedArgs: {"value": appName}),
                                style: Theme.of(context).textTheme.bodyLarge,
                                softWrap: true,
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 8,
                                ),
                                title: Text(
                                  context.tr("accountDeactivateFaq1",
                                      namedArgs: {"value": appName}),
                                  softWrap: true,
                                ),
                                titleTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 8,
                                ),
                                title: Text(
                                  context.tr("accountDeactivateFaq2"),
                                  softWrap: true,
                                ),
                                titleTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 8,
                                ),
                                title: Text(
                                  context.tr("accountDeactivateFaq3"),
                                  softWrap: true,
                                ),
                                titleTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 24),
                              AutoSizeText(
                                context.tr("accountDeactivateFaq4",
                                    namedArgs: {"value": appSite}),
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: Text(
                                        context.tr("accountDeactivateContinue"),
                                        softWrap: true,
                                      ),
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
                              AutoSizeText(
                                context.tr("accountLeavingUsText"),
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                      leading: Radio(
                                        value: true,
                                        onChanged: (bool? value) {},
                                        groupValue: false,
                                      ),
                                      title: Text(
                                        context.tr("accountLeavingUsReason1",
                                            namedArgs: {"value": appName}),
                                        softWrap: true,
                                      ))),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: Text(
                                  context.tr("accountLeavingUsReason2",
                                      namedArgs: {"value": appName}),
                                  softWrap: true,
                                ),
                              )),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: Text(
                                  context.tr("accountLeavingUsReasonNull"),
                                  softWrap: true,
                                ),
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: Text(
                                        context.tr("accountDeleteTitle"),
                                        softWrap: true,
                                      ),
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
                              AutoSizeText(
                                "I'm leaving because",
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
                              const SizedBox(height: 8),
                              Card(
                                  child: ListTile(
                                leading: Radio(
                                  value: true,
                                  onChanged: (bool? value) {},
                                  groupValue: false,
                                ),
                                title: const Text(
                                  "I'm unhappy with myTodo's policies",
                                  softWrap: true,
                                ),
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
                                  "myTodo's applications is/are to complicated or hard to use",
                                  softWrap: true,
                                ),
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
                                  "Other",
                                  softWrap: true,
                                ),
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
                                      child: Text(
                                        "Deactivate Account",
                                        softWrap: true,
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 48),
                            ]))))));
  }
}
