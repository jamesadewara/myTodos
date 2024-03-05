import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/props.dart';
import 'package:mytodo/control/store/actions.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:mytodo/view/custom_widgets/decorated_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AppearanceComponent extends StatefulWidget {
  const AppearanceComponent({
    super.key,
  });

  @override
  State<AppearanceComponent> createState() => _AppearanceComponentState();
}

class _AppearanceComponentState extends State<AppearanceComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ThemeProps> themeList = [
      ThemeProps(
          id: "system",
          value: AppLocalizations.of(context)!.appearanceSystemTitle,
          image: "assets/images/bg/system.png"),
      ThemeProps(
          id: "light",
          value: AppLocalizations.of(context)!.appearanceLightTitle,
          image: "assets/images/bg/light.png"),
      ThemeProps(
          id: "dark",
          value: AppLocalizations.of(context)!.appearanceDarkTitle,
          image: "assets/images/bg/dark.png"),
    ];
    return StoreConnector<AppState, String>(
        converter: (store) => store.state.theme,
        builder: (context, currentTheme) {
          return ResponsiveStaggeredGridList(
              desiredItemWidth: 160,
              children: themeList.map((e) {
                return DecoratedCard(
                    value: currentTheme == e.id,
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
              }).toList());
        });
  }
}
