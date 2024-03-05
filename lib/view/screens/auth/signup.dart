import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

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

    return SafeArea(
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
            AutoSizeText(AppLocalizations.of(context)!.signUpText,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            AutoSizeText(
                AppLocalizations.of(context)!.signUpDescriptionText("myTodo's"),
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium),
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
                    Text(AppLocalizations.of(context)!.emailText),
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
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.emailHint),
                    ),
                    const SizedBox(height: 64),
                    Center(
                        child: FilledButton(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: Text(AppLocalizations.of(context)!.continueText),
                      ),
                      onPressed: () async {
                        handleSubmit();
                      },
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                    ListTile(
                        title: Text(AppLocalizations.of(context)!
                            .alreadyHaveAnAccountText),
                        subtitle: Row(children: [
                          TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(AuthRoutes.login);
                              },
                              child: Text(
                                  AppLocalizations.of(context)!.signInText)),
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
    ));
  }
}
