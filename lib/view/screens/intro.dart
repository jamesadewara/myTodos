import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/intro.png",
            width: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? 240
                : 320,
            height: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? 240
                : 320,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                AutoSizeText(
                  AppLocalizations.of(context)!.introTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
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
                    AppLocalizations.of(context)!.introDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                FilledButton(
                    onPressed: () async {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Text(AppLocalizations.of(context)!.exitIntroText),
                    )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
