import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

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
                    child: Stack(children: [
                      SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32),
                                    child: AutoSizeText(
                                      context.tr('introTitle'),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      softWrap: true,
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
                                      context.tr("introDescription"),
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 3,
                                      softWrap: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 48,
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: FilledButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Theme.of(context).primaryColor),
                                  foregroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white)),
                              onPressed: () async {
                                GoRouter.of(context)
                                    .pushNamed(IntroRoutes.selectAppearance);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Text(context.tr('exitIntroText'),softWrap: true,),
                              )),
                        ),
                      ),
                    ])))));
  }
}
