import 'package:flutter/material.dart';
import 'package:mytodo/view/components/appearance_component.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectAppearanceView extends StatefulWidget {
  const SelectAppearanceView({
    super.key,
  });

  @override
  State<SelectAppearanceView> createState() => _SelectAppearanceViewState();
}

class _SelectAppearanceViewState extends State<SelectAppearanceView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.chooseAppAppearanceText)),
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
                    child: const AppearanceComponent(),
                  )))),
        ));
  }
}
