import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

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
  List<Map<String, dynamic>> iconList = [
    {
      "icon": Icons.home_outlined,
      "selectedIcon": Icons.home,
      "label": "Home",
      "route": AppRoutes.home
    },
    {
      "icon": Icons.event_outlined,
      "selectedIcon": Icons.event,
      "label": "Task",
      "route": AppRoutes.task
    },
    {
      "icon": Icons.notifications_off_outlined,
      "selectedIcon": Icons.notifications_off,
      "label": "Distractions",
      "route": AppRoutes.home
    },
    {
      "icon": Icons.group_outlined,
      "selectedIcon": Icons.group,
      "label": "Profile",
      "route": AppRoutes.home
    },
  ];

  @override
  void initState() {
    _appNavIndex = widget.currentState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      color: Theme.of(context).colorScheme.primary,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                                tooltip: index["label"],
                                onPressed: () => setState(
                                      () {
                                        _appNavIndex = iconList.indexOf(index);
                                        Navigator.of(context)
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
          backgroundColor:
              ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background,
          foregroundColor:
              !ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background,
          tooltip: "Add a new task",
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation:
            ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? FloatingActionButtonLocation.centerDocked
                : FloatingActionButtonLocation.startTop,
        bottomNavigationBar: Visibility(
          visible: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET),
          child: AnimatedBottomNavigationBar.builder(
            backgroundColor: Theme.of(context).colorScheme.primary,
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return Icon(
                  isActive
                      ? iconList[index]["selectedIcon"]
                      : iconList[index]["icon"],
                  size: 24,
                  color: Theme.of(context).colorScheme.background);
            },
            activeIndex: _appNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) => setState(() {
              _appNavIndex = index;
              Navigator.of(context)
                  .pushReplacementNamed(iconList[index]["route"]);
            }),
          ),
        ));
  }
}
