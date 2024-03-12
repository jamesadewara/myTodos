import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/control/constants/validators.dart';
import 'package:mytodo/src/model/bloc/authentication_bloc.dart';
import 'package:mytodo/src/model/states/auth/authentication_event_state.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      if (_loginFormKey.currentState!.validate()) {
        BlocProvider.of<AuthenticationBloc>(context).add(
          SignUpUserRequested(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          ),
        );
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
            child: SizedBox(
              width: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                  ? null
                  : 360,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Icon(
                      Icons.lock_person,
                      size: 120,
                    ),
                    const SizedBox(height: 10),
                    AutoSizeText(context.tr("signInText"),
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    AutoSizeText(
                        context.tr("signInDescriptionText",
                            namedArgs: {"value": appName}),
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Form(
                        key: _loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(context.tr("emailText")),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              onFieldSubmitted: (value) {
                                handleSubmit();
                              },
                              validator: (value) {
                                return validateUserEmail(value,
                                    context: context);
                              },
                              decoration: InputDecoration(
                                  hintText: context.tr("emailHint")),
                            ),
                            const SizedBox(height: 32),
                            Text(context.tr("passwordText")),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              onFieldSubmitted: (value) {
                                handleSubmit();
                              },
                              validator: (value) {
                                return validateUserPassword(value,
                                    context: context);
                              },
                              decoration: InputDecoration(
                                hintText: context.tr("passwordHint"),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              child: Text(
                                context.tr("forgottenPasswordText"),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                        fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(AuthRoutes.forgotPassword);
                              },
                            ),
                            const SizedBox(height: 64),
                            Center(
                              child: FilledButton(
                                  onPressed: () async {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    handleSubmit();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, top: 8, bottom: 8),
                                    child: Text(context.tr("submitText")),
                                  )),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            ListTile(
                                title: Text(context.tr("haveNotAnAccountText")),
                                subtitle: Row(children: [
                                  TextButton(
                                      onPressed: () {
                                        GoRouter.of(context)
                                            .pushNamed(AuthRoutes.signup);
                                      },
                                      child: Text(context.tr("signUpText"))),
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
          )),
    ));
  }
}
