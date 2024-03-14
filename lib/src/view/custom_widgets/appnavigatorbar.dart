import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/view/custom_widgets/notificator.dart';
import 'package:mytodo/src/view/custom_widgets/profile_img.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AppNavigationBar extends StatefulWidget {
  final Widget child;
  final int currentState;
  final bool hideAppBar;
  final bool hideBackground;

  final Widget title;
  final Widget? leading;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;

  final ScrollController? scrollController;

  const AppNavigationBar(
      {super.key,
      required this.child,
      required this.currentState,
      this.hideAppBar = false,
      this.hideBackground = false,
      this.automaticallyImplyLeading = true,
      this.title = const Text(""),
      this.leading,
      this.actions = const [],
      this.scrollController});

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
    Brightness currentBrightness = Theme.of(context).brightness;
    // print(Theme.of(context).colorScheme.background);
    return Scaffold(
        appBar: widget.hideAppBar
            ? null
            : AppBar(
                backgroundColor: widget.hideBackground
                    ? Colors.transparent
                    : Theme.of(context).scaffoldBackgroundColor,
                title: widget.title,
                leading: widget.leading,
                automaticallyImplyLeading: widget.automaticallyImplyLeading,
                actions: [
                  const NotificatorButton(),
                  Row(children: widget.actions.toList())
                ],
              ),
        drawer: kIsWeb
            ? Drawer(
                child: Column(children: [
                UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  accountName: const Text("Adewara James",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  accountEmail: const Text("jamesadewara1@gmail.com",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  currentAccountPicture: const ProfileImage(
                    image: "",
                    size: 62,
                  ),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  children: iconList(context: context).map((index) {
                    return ListTile(
                      leading: Icon(
                        index.id == _appNavIndex.toString()
                            ? index.selectedIcon
                            : index.icon,
                      ),
                      title: Text(index.label),
                      onTap: () => setState(
                        () {
                          _appNavIndex = int.parse(index.id);
                          GoRouter.of(context)
                              .pushReplacementNamed(index.route);
                        },
                      ),
                    );
                  }).toList(),
                )
              ]))
            : null,
        body: Stack(children: [
          kIsWeb
              ? widget.child
              : Row(
                  children: [
                    Visibility(
                      visible: !ResponsiveBreakpoints.of(context)
                          .between(MOBILE, TABLET),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:
                                      iconList(context: context).map((index) {
                                    return IconButton(
                                        icon: Icon(
                                            index.id == _appNavIndex.toString()
                                                ? index.selectedIcon
                                                : index.icon,
                                            size: 24,
                                            color: Colors.white),
                                        tooltip: index.label,
                                        onPressed: () => setState(
                                              () {
                                                _appNavIndex =
                                                    int.parse(index.id);
                                                GoRouter.of(context)
                                                    .pushReplacementNamed(
                                                        index.route);
                                              },
                                            ));
                                  }).toList()))),
                    ),
                    Expanded(
                      child: widget.child,
                    ),
                  ],
                ),
          widget.scrollController != null
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_drop_up),
                            onPressed: () {
                              setState(() {
                                widget.scrollController?.jumpTo(0);
                              });
                            },
                          ))))
              : const Center(),
        ]),
        floatingActionButton: kIsWeb
            ? null
            : FloatingActionButton(
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
        floatingActionButtonLocation: kIsWeb
            ? null
            : ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? FloatingActionButtonLocation.centerDocked
                : FloatingActionButtonLocation.startTop,
        bottomNavigationBar: kIsWeb
            ? null
            : Visibility(
                visible:
                    ResponsiveBreakpoints.of(context).between(MOBILE, TABLET),
                child: AnimatedBottomNavigationBar.builder(
                  backgroundColor: currentBrightness == Brightness.light
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.surface,
                  itemCount: iconList(context: context).length,
                  tabBuilder: (int index, bool isActive) {
                    return Icon(
                        isActive
                            ? iconList(context: context)[index].selectedIcon
                            : iconList(context: context)[index].icon,
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
                    GoRouter.of(context).pushReplacementNamed(
                        iconList(context: context)[index].route);
                  }),
                ),
              ));
  }
}
