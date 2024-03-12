import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/constants/store/actions.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:mytodo/src/view/custom_widgets/decorated_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AppearanceScreen extends StatefulWidget {
  final AppState appState;
  final GoRouterState state;
  const AppearanceScreen({
    super.key,
    required this.appState,
    required this.state,
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
    return AppNavigationBar(
        currentState: 3,
        child: SafeArea(
          child: AppearancePage(
            appState: widget.appState,
            state: widget.state,
          ),
        ));
  }
}

class AppearancePage extends StatefulWidget {
  final AppState appState;
  final GoRouterState state;
  const AppearancePage({
    super.key,
    required this.appState,
    required this.state,
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
            title: Text(context.tr("appearanceTitle"))),
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
                  child: ResponsiveStaggeredGridList(
                    desiredItemWidth: 160,
                    children: themeList(context: context).map((e) {
                      return DecoratedCard(
                          value: e.id == widget.appState.theme,
                          title: e.value,
                          subtitle: "",
                          image: e.image,
                          onChanged: (value) {
                            setState(() {
                              StoreProvider.of<AppState>(context)
                                  .dispatch(UpdateThemeAction(e.id));
                            });
                          },
                          groupValue: true);
                    }).toList(),
                  ),
                )))));
  }
}
