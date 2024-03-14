import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/control/constants/validators.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SignupScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const SignupScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      if (_signupFormKey.currentState!.validate()) {
        GoRouter.of(context).pushNamed(AuthRoutes.createPassword);
      }
    }

    return Scaffold(
        body: SafeArea(
            child: Scrollbar(
      controller: _scrollController,
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 0;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 48,
                    )),
              ],
            ),
            const SizedBox(height: 50),
            const Icon(
              Icons.person_pin,
              size: 120,
            ),
            const SizedBox(height: 10),
            AutoSizeText(
              context.tr("signUpText"),
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            const SizedBox(height: 8),
            AutoSizeText(
              context
                  .tr("signUpDescriptionText", namedArgs: {"value": appName}),
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(
                  left:
                      ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                          ? 12
                          : 240,
                  right:
                      ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                          ? 12
                          : 240),
              child: Form(
                key: _signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.tr("emailText"),
                      softWrap: true,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      onFieldSubmitted: (value) {
                        handleSubmit();
                      },
                      validator: (value) {
                        return validateUserEmail(value, context: context);
                      },
                      decoration:
                          InputDecoration(hintText: context.tr("emailHint")),
                    ),
                    const SizedBox(height: 64),
                    Center(
                        child: FilledButton(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: Text(
                          context.tr("continueText"),
                          softWrap: true,
                        ),
                      ),
                      onPressed: () async {
                        handleSubmit();
                      },
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                    ListTile(
                        title: Text(
                          context.tr("alreadyHaveAnAccountText"),
                          softWrap: true,
                        ),
                        subtitle: Row(children: [
                          TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(AuthRoutes.login);
                              },
                              child: Text(
                                context.tr("signInText"),
                                softWrap: true,
                              )),
                          const Flexible(child: Center())
                        ])),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    )));
  }
}
