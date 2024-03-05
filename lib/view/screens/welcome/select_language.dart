import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/control/config.dart';
import 'package:mytodo/control/store/actions.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectLanguagePage extends StatefulWidget {
  final AppState appState;
  final GoRouterState state;

  const SelectLanguagePage({
    super.key,
    required this.appState,
    required this.state,
  });
  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  final _scrollController = ScrollController();
  late AppState selectedAppState;

  @override
  void initState() {
    selectedAppState = widget.state.extra as AppState;
    selectedAppState.language = widget.appState.language;
    super.initState();
  }

  void handleSubmit(AppState appState) {
    setState(() {
      StoreProvider.of<AppState>(context).dispatch(ToggleIntroAction(false));
      StoreProvider.of<AppState>(context)
          .dispatch(UpdateLanguageAction(appState.language));
      StoreProvider.of<AppState>(context)
          .dispatch(UpdateThemeAction(appState.theme));
    });
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
          AppLocalizations.of(context)!.languageTitle,
        ),
        actions: [
          Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: IconButton(
                    onPressed: () {
                      handleSubmit(selectedAppState);
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
                        AppLocalizations.of(context)!.chooseAppLanguageText,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: supportedLocales.map((e) {
                            return Column(
                              children: [
                                const SizedBox(height: 8),
                                CheckboxListTile(
                                  value: e.locale.languageCode ==
                                      selectedAppState.language,
                                  onChanged: (value) {
                                    print(selectedAppState.language);
                                    print(e.locale.languageCode);
                                    setState(() {
                                      selectedAppState.language =
                                          e.locale.languageCode;
                                    });
                                  },
                                  tileColor:
                                      Theme.of(context).colorScheme.surface,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  title: Text(e.name),
                                ),
                              ],
                            );
                          }).toList()),
                      const SizedBox(height: 16),
                    ],
                  ),
                )))),
      ),
    );
  }
}
