import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _scrollController = ScrollController();

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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/illustrator/intro.png",
                            width: ResponsiveBreakpoints.of(context)
                                    .between(MOBILE, TABLET)
                                ? 240
                                : 320,
                            height: ResponsiveBreakpoints.of(context)
                                    .between(MOBILE, TABLET)
                                ? 240
                                : 320,
                          ),
                          const SizedBox(height: 24),
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
                              ],
                            ),
                          ),
                          Center(
                              child: Card(
                                  color: Theme.of(context).primaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: IconButton(
                                        onPressed: () {
                                          GoRouter.of(context)
                                              .pushReplacementNamed(
                                                  IntroRoutes.selectAppearance);
                                        },
                                        icon: const Icon(
                                          Icons.chevron_right,
                                          color: Colors.white,
                                        )),
                                  ))),
                          const SizedBox(
                            height: 48,
                          )
                        ],
                      ),
                    )))));
  }
}
