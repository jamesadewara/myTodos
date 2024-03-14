import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/view/custom_widgets/appnavigatorbar.dart';
import 'package:mytodo/src/view/custom_widgets/dropdown_modal.dart';
import 'package:mytodo/src/view/custom_widgets/profile_img.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfileScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const ProfileScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppNavigationBar(
        currentState: 3,
        automaticallyImplyLeading: false,
        title: Text(
          context.tr("profileTitle"),
          softWrap: true,
        ),
        child: const SafeArea(
          child: ProfilePage(
            isDesktop: false,
          ),
        ));
  }
}

class ProfilePage extends StatefulWidget {
  final bool isDesktop;
  const ProfilePage({
    super.key,
    required this.isDesktop,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isDesktop
        ? Card(
            child: SizedBox(
                width: 320,
                child: Scrollbar(
                    controller: _scrollController,
                    notificationPredicate: (ScrollNotification notification) {
                      return notification.depth == 0;
                    },
                    child: SingleChildScrollView(
                        controller: _scrollController,
                        child: profileBody(context)))))
        : Scrollbar(
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
                        child: profileBody(context)))));
  }

  Widget profileBody(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Center(
              child: ProfileImage(
            image: '',
            size: 128,
          )),
          const SizedBox(
            height: 48,
          ),
          ListTile(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              title: Text(
                context.tr("usernameText", namedArgs: {"value": ":"}),
                softWrap: true,
              ),
              subtitle: const Text(
                'Adewara James Ayomide',
                softWrap: true,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return InputModal(
                        title: context.tr("nameText"),
                        hintText: context.tr("nameHint"),
                        inputType: TextInputType.name);
                  },
                );
              }),
          const SizedBox(
            height: 4,
          ),
          ListTile(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            title: Text(
              context.tr("emailText"),
              softWrap: true,
            ),
            subtitle: const Text(
              'jamesadewara1@maigl.com',
              softWrap: true,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          ListTile(
            title: Text(
              context.tr("aboutText"),
              softWrap: true,
            ),
            subtitle: const Text(
              'I love programming',
              softWrap: true,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const SizedBox(
            height: 12,
          ),
        ]);
  }
}
