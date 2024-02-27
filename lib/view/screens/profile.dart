import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/config.dart';
import 'package:mytodo/view/components/appnavigatorbar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
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
    return const AppNavigationBar(
        currentState: 3,
        child: SafeArea(
          child: ProfilePage(),
        ));
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
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
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Profile"),
        ),
        body: Scrollbar(
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, top: 8, bottom: 8),
                                    child: CachedNetworkImage(
                                      height: 180,
                                      imageUrl: profileImg,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          Center(
                                              child: CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress)),
                                      errorWidget: (context, url, error) =>
                                          const Card(child: Icon(Icons.person)),
                                    ),
                                  )),
                              const SizedBox(
                                height: 48,
                              ),
                              ListTile(
                                  title: const Text('Username:'),
                                  subtitle: const Text('Adewara James Ayomide'),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Input Dialog'),
                                          content: const TextField(
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter your input here"),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Submit'),
                                              onPressed: () {
                                                // Handle the submit action
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }),
                              const SizedBox(
                                height: 4,
                              ),
                              const ListTile(
                                title: Text('Email:'),
                                subtitle: Text('jamesadewara1@maigl.com'),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const ListTile(
                                title: Text('About:'),
                                subtitle: Text('I love programming'),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ]))))));
  }
}
