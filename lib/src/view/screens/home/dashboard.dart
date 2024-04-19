import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:mytodo/src/view/custom_widgets/circular_prorgess.dart';
import 'package:mytodo/src/view/custom_widgets/heading.dart';
import 'package:mytodo/src/view/custom_widgets/notificator.dart';
import 'package:mytodo/src/view/custom_widgets/profile_img.dart';
import 'package:mytodo/src/view/custom_widgets/progress_card.dart';
import 'package:mytodo/src/view/custom_widgets/task_listtile.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const DashboardScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool hideAppBar = true;

  @override
  void initState() {
    hideAppBar = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppNavigationBar(
        currentState: 0,
        hideAppBar: hideAppBar,
        automaticallyImplyLeading: false,
        title: const Text(
          "Adewara James",
          softWrap: true,
        ),
        child: DashboardPage(
          onHide: (bool value) {
            setState(() {
              hideAppBar = value;
            });
          },
        ));
  }
}

class DashboardPage extends StatefulWidget {
  final Function(bool) onHide;

  const DashboardPage({
    super.key,
    required this.onHide,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: _scrollController,
        notificationPredicate: (ScrollNotification notification) {
          if (_scrollController.offset > 48) {
            widget.onHide(false);
          } else {
            widget.onHide(true);
          }

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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 16),
                          ListTile(
                              leading: SizedBox(
                                width: 48,
                                height: 48,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const ProfileImage(
                                    image: "",
                                    size: 32,
                                  ),
                                ),
                              ),
                              title: Text(
                                context.tr(
                                  'welcomeText',
                                ),
                                style: Theme.of(context).textTheme.bodySmall,
                                softWrap: true,
                              ),
                              subtitle: Text(
                                "Adewara James",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              trailing: const NotificatorButton()),
                          Stack(
                            children: [
                              Container(
                                  margin: ResponsiveBreakpoints.of(context)
                                          .between(MOBILE, TABLET)
                                      ? null
                                      : const EdgeInsets.only(right: 160),
                                  height: 160,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 8, bottom: 24),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: AutoSizeText(
                                                  "Your today's task almost done!",
                                                  wrapWords: true,
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall
                                                      ?.copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.more_horiz,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {},
                                              )
                                            ],
                                          ),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                foregroundColor:
                                                    MaterialStatePropertyAll(
                                                        Theme.of(context)
                                                            .primaryColor),
                                                backgroundColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.white),
                                              ),
                                              onPressed: () {
                                                GoRouter.of(context).pushNamed(
                                                  AppRoutes.task,
                                                );
                                              },
                                              child: const Text(
                                                "Continue",
                                                softWrap: true,
                                              ))
                                        ]),
                                  )),
                              Positioned(
                                top: ResponsiveBreakpoints.of(context)
                                        .between(MOBILE, TABLET)
                                    ? 50
                                    : 45,
                                right: ResponsiveBreakpoints.of(context)
                                        .between(MOBILE, TABLET)
                                    ? 10
                                    : 130,
                                child: Container(
                                    width: 84,
                                    height: 84,
                                    decoration: BoxDecoration(
                                        color: ResponsiveBreakpoints.of(context)
                                                .between(MOBILE, TABLET)
                                            ? null
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: CustomCircularProgressIndicator(
                                      color: !ResponsiveBreakpoints.of(context)
                                              .between(MOBILE, TABLET)
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      textColor:
                                          !ResponsiveBreakpoints.of(context)
                                                  .between(MOBILE, TABLET)
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                              : Colors.white,
                                      strokeAlign: 8,
                                      strokeWidth: 4,
                                      value: .55,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Heading(
                              title: context.tr("inProgressText"),
                              subtitle: "6"),
                          const SizedBox(
                            height: 8,
                          ),
                          const SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ProgressCard(
                                    color: Colors.orangeAccent,
                                    title: "Office Project",
                                    subtitle: "Grocery shopping app design",
                                    progressColor: Colors.deepOrange,
                                    value: .67,
                                    icon: Icon(Icons.wysiwyg, size: 16),
                                    iconBgColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          Heading(
                              title: context.tr("taskGroupText"),
                              subtitle: "4"),
                          const SizedBox(
                            height: 8,
                          ),
                          TaskListTile(
                            onTap: () {
                              GoRouter.of(context)
                                  .pushNamed(AppRoutes.taskGroup);
                            },
                            title: "Personal Project",
                            subtitle: "30 Tasks",
                            value: .7,
                            icon: const Icon(
                              Icons.person,
                              size: 16,
                            ),
                            iconBgColor: Colors.orangeAccent,
                          ),
  const SizedBox(
                            height: 8,
                          ),
                           TaskListTile(
                            onTap: () {
                              GoRouter.of(context)
                                  .pushNamed(AppRoutes.taskGroup);
                            },
                            title: "Office Project",
                            subtitle: "30 Tasks",
                            value: .7,
                            icon: const Icon(
                              Icons.person,
                              size: 16,
                            ),
                            iconBgColor: Colors.orangeAccent,
                          ),const SizedBox(
                            height: 8,
                          ),
                           TaskListTile(
                            onTap: () {
                              GoRouter.of(context)
                                  .pushNamed(AppRoutes.taskGroup);
                            },
                            title: "Buisness Project",
                            subtitle: "30 Tasks",
                            value: .7,
                            icon: const Icon(
                              Icons.person,
                              size: 16,
                            ),
                            iconBgColor: Colors.orangeAccent,
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                        ])))));
  }
}
