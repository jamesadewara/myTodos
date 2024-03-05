import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/config.dart';
import 'package:mytodo/control/store/actions.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:mytodo/view/components/appearance_component.dart';
import 'package:mytodo/view/custom_widgets/decorated_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SelectAppearancePage extends StatefulWidget {
  const SelectAppearancePage({
    super.key,
  });

  @override
  State<SelectAppearancePage> createState() => _SelectAppearancePageState();
}

class _SelectAppearancePageState extends State<SelectAppearancePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Expanded(
      child: ResponsiveStaggeredGridList(
          desiredItemWidth: 160,
          children: themeList(context: context).map((e) {
            return DecoratedCard(
                value: true,
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
          }).toList()),
    )));
  }
}
