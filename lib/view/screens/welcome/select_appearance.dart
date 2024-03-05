import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/control/config.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:mytodo/view/custom_widgets/decorated_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SelectAppearancePage extends StatefulWidget {
  final AppState appState;
  final GoRouterState state;

  const SelectAppearancePage({
    super.key,
    required this.appState,
    required this.state,
  });
  @override
  State<SelectAppearancePage> createState() => _SelectAppearancePageState();
}

class _SelectAppearancePageState extends State<SelectAppearancePage> {
  final _scrollController = ScrollController();
  late AppState selectedAppState;

  @override
  void initState() {
    selectedAppState =
        AppState(isIntro: false, theme: widget.appState.theme, language: '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  )),
            )),
        title: Text(
          AppLocalizations.of(context)!.appearanceTitle,
        ),
        actions: [
          Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(IntroRoutes.selectLanguage,
                          extra: selectedAppState);
                    },
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    )),
              ))
        ],
      ),
      body: SafeArea(
        child: Scrollbar(
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
                    children: [
                      Text(
                        AppLocalizations.of(context)!.chooseAppAppearanceText,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ResponsiveStaggeredGridList(
                        desiredItemWidth: 160,
                        children: themeList(context: context).map((e) {
                          return DecoratedCard(
                              value: e.id == selectedAppState.theme,
                              title: e.value,
                              subtitle: "",
                              image: e.image,
                              onChanged: (value) {
                                setState(() {
                                  selectedAppState.theme = e.id;
                                });
                              },
                              groupValue: true);
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                )))),
      ),
    );
  }
}
