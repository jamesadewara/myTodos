import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/store.dart';
import 'package:responsive_framework/responsive_framework.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _scrollController = ScrollController();

  void cancelIntro() {
    AppState(isIntro: false);
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Align(
                alignment: Alignment.center,
                child: Scrollbar(
                    controller: _scrollController,
                    notificationPredicate: (ScrollNotification notification) {
                      return notification.depth == 0;
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/intro.png",
                            width: ResponsiveBreakpoints.of(context)
                                    .between(MOBILE, TABLET)
                                ? 240
                                : 320,
                            height: ResponsiveBreakpoints.of(context)
                                    .between(MOBILE, TABLET)
                                ? 240
                                : 320,
                          ),
                          const SizedBox(height: 140),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32, right: 32),
                                  child: AutoSizeText(
                                    AppLocalizations.of(context)!.introTitle,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: ResponsiveBreakpoints.of(context)
                                            .between(MOBILE, TABLET)
                                        ? 0
                                        : 84,
                                    right: ResponsiveBreakpoints.of(context)
                                            .between(MOBILE, TABLET)
                                        ? 0
                                        : 84,
                                  ),
                                  child: AutoSizeText(
                                    AppLocalizations.of(context)!
                                        .introDescription,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    maxLines: 3,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                FilledButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Theme.of(context).primaryColor),
                                        foregroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: () async {
                                      cancelIntro();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: Text(AppLocalizations.of(context)!
                                          .exitIntroText),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 48,
                          )
                        ],
                      ),
                    )))));
  }
}
