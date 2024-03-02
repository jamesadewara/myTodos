import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/validators.dart';
import 'package:mytodo/model/bloc/authentication_bloc.dart';
import 'package:mytodo/model/states/auth/authentication_event_state.dart';
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
                    AutoSizeText('SIGN IN',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    AutoSizeText('with your aiVilah account',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Form(
                        key: _loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'E-mail',
                            ),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              validator: validateUserEmail,
                              decoration: const InputDecoration(
                                hintText: 'Enter your email',
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Password',
                            ),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              validator: validateUserPassword,
                              decoration: const InputDecoration(
                                hintText: 'Enter your password',
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              child: Text(
                                'Forgot password',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                        fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AuthRoutes.forgotPassword);
                              },
                            ),
                            const SizedBox(height: 64),
                            Center(
                              child: FilledButton(
                                  onPressed: () async {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_loginFormKey.currentState!
                                        .validate()) {
                                      BlocProvider.of<AuthenticationBloc>(
                                              context)
                                          .add(
                                        SignUpUserRequested(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim(),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 16, right: 16, top: 8, bottom: 8),
                                    child: Text('Submit'),
                                  )),
                            )
                            //sign in button
                            ,
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
