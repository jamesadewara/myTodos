import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/constants/store/actions.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LanguageScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const LanguageScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
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
    return AppNavigationBar(
        currentState: 3,
        automaticallyImplyLeading: false,
        title: Text(
          context.tr("languageTitle"),
          softWrap: true,
        ),
        child: const SafeArea(
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
    return Scrollbar(
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
                        converter: (store) => store.state.language,
                        builder: (context, currentLanguage) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: supportedLocales.map((e) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    CheckboxListTile(
                                      value: currentLanguage ==
                                          e.locale.languageCode,
                                      onChanged: (value) {
                                        setState(() {
                                          StoreProvider.of<AppState>(context)
                                              .dispatch(UpdateLanguageAction(
                                                  e.locale.languageCode));
                                        });
                                      },
                                      tileColor:
                                          Theme.of(context).colorScheme.surface,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      title: Text(
                                        e.name,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList());
                        })))));
  }
}
