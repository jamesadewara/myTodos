import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mytodo/view/screens/welcome/demo.dart';
import 'package:mytodo/view/screens/welcome/onboarding.dart';
import 'package:mytodo/view/screens/welcome/select_appearance.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _viewController = PageController();
  final List<Widget> views = [
    const OnboardingView(),
    const SelectAppearanceView(),
    const ExampleView(NotificationAppLaunchDetails(true))
  ];

  int currentView = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          PageView(
              controller: _viewController,
              onPageChanged: (int index) {
                setState(() {
                  currentView = index;
                });
              },
              children: views),
          Row(
            children: [
              Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: IconButton(
                        onPressed: () {
                          _viewController.previousPage(
                              duration: const Duration(microseconds: 1),
                              curve: Curves.easeIn);
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        )),
                  )),
              currentView != views.length
                  ? Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: IconButton(
                            onPressed: () {
                              _viewController.nextPage(
                                  duration: const Duration(microseconds: 1),
                                  curve: Curves.easeIn);
                            },
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            )),
                      ))
                  : Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.done,
                              color: Colors.white,
                            )),
                      )),
            ],
          )
        ]));
  }
}
