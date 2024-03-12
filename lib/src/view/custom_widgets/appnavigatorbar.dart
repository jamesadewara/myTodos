import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppNavigationBar extends StatefulWidget {
  final Widget child;
  final int currentState;
  const AppNavigationBar(
      {super.key, required this.child, required this.currentState});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  late int _appNavIndex;

  @override
  void initState() {
    _appNavIndex = widget.currentState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> iconList = [
      {
        "icon": Icons.home_outlined,
        "selectedIcon": Icons.home,
        "label": context.tr("homeTitle"),
        "route": AppRoutes.home
      },
      {
        "icon": Icons.event_outlined,
        "selectedIcon": Icons.event,
        "label": context.tr("taskTitle"),
        "route": AppRoutes.task
      },
      {
        "icon": Icons.find_in_page_outlined,
        "selectedIcon": Icons.find_in_page,
        "label": context.tr("browseTitle"),
        "route": AppRoutes.browse
      },
      {
        "icon": Icons.group_outlined,
        "selectedIcon": Icons.group,
        "label": context.tr("settingsTitle"),
        "route": AppRoutes.settings
      },
    ];

    Brightness currentBrightness = Theme.of(context).brightness;
    return Scaffold(
        body: Row(
          children: [
            Visibility(
              visible:
                  !ResponsiveBreakpoints.of(context).between(MOBILE, TABLET),
              child: Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  width: 72,
                  decoration: BoxDecoration(
                      color: currentBrightness == Brightness.light
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 72, bottom: 24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: iconList.map((index) {
                            return IconButton(
                                icon: Icon(
                                    iconList.indexOf(index) == _appNavIndex
                                        ? index["selectedIcon"]
                                        : index["icon"],
                                    size: 24,
                                    color: Colors.white),
                                tooltip: index["label"],
                                onPressed: () => setState(
                                      () {
                                        _appNavIndex = iconList.indexOf(index);
                                        GoRouter.of(context)
                                            .pushReplacementNamed(
                                                index["route"]);
                                      },
                                    ));
                          }).toList()))),
            ),
            Expanded(
              child: widget.child,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          hoverColor: Colors.transparent,
          backgroundColor:
              ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).scaffoldBackgroundColor,
          foregroundColor:
              !ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                  ? Theme.of(context).primaryColor
                  : Colors.white,
          tooltip: context.tr("addTaskText"),
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRoutes.addTask);
          },
        ),
        floatingActionButtonLocation:
            ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? FloatingActionButtonLocation.centerDocked
                : FloatingActionButtonLocation.startTop,
        bottomNavigationBar: Visibility(
          visible: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET),
          child: AnimatedBottomNavigationBar.builder(
            backgroundColor: currentBrightness == Brightness.light
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.surface,
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return Icon(
                  isActive
                      ? iconList[index]["selectedIcon"]
                      : iconList[index]["icon"],
                  size: 24,
                  color: Colors.white);
            },
            activeIndex: _appNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) => setState(() {
              _appNavIndex = index;
              GoRouter.of(context)
                  .pushReplacementNamed(iconList[index]["route"]);
            }),
          ),
        ));
  }
}