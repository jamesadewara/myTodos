import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/store/actions.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:mytodo/view/custom_widgets/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final List<Map<String, String>> themeList = [
      {
        "id": "system",
        "value": AppLocalizations.of(context)!.appearanceSystemTitle
      },
      {
        "id": "light",
        "value": AppLocalizations.of(context)!.appearanceLightTitle
      },
      {"id": "dark", "value": AppLocalizations.of(context)!.appearanceDarkTitle}
    ];

    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(AppLocalizations.of(context)!.appearanceTitle)),
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
                            converter: (store) => store.state.theme,
                            builder: (context, currentTheme) {
                              return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: themeList.map((e) {
                                    return Column(
                                      children: [
                                        const SizedBox(height: 8),
                                        CheckboxListTile(
                                          value: currentTheme == e["id"],
                                          onChanged: (value) {
                                            setState(() {
                                              StoreProvider.of<AppState>(
                                                      context)
                                                  .dispatch(UpdateThemeAction(
                                                      e["id"]!));
                                            });
                                          },
                                          tileColor: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          title: Text(e["value"]!),
                                        ),
                                      ],
                                    );
                                  }).toList());
                            }))))));
  }
}
