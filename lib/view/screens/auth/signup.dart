import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytodo/control/notifier_listener.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/validators.dart';
import 'package:provider/provider.dart';
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
    NotifyListener listener = context.watch<NotifyListener>();
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
                      validator: validateUserEmail,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.emailHint),
                    ),
                    const SizedBox(height: 64),
                    Center(
                        child: FilledButton(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: Text(AppLocalizations.of(context)!.continueText),
                      ),
                      onPressed: () async {
                        // Navigator.of(context)
                        //     .pushNamed(AuthRoutes.createPassword);
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_signupFormKey.currentState!.validate()) {
                          // listener.setLoading(value: true);

                          // Timer(const Duration(seconds: 2), () {
                          //   listener.setLoading(value: false);
                        }
                      },
                    )),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                            AppLocalizations.of(context)!
                                .alreadyHaveAnAccountText,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(AuthRoutes.login);
                          },
                          child: AutoSizeText(
                              AppLocalizations.of(context)!.signInText,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
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
