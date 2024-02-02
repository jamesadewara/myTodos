import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/validators.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset("assets/images/icon.png"),
          actions: <Widget>[
            TextButton(onPressed: () {}, child: const Text("Create an account"))
          ]),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 50),
              //logo
              const Icon(
                Icons.lock_person,
                size: 120,
              ),
              const SizedBox(height: 10),
              //welcome back you been missed

              AutoSizeText('LOGIN',
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(
                    left: ResponsiveBreakpoints.of(context)
                            .between(MOBILE, TABLET)
                        ? 12
                        : 240,
                    right: ResponsiveBreakpoints.of(context)
                            .between(MOBILE, TABLET)
                        ? 12
                        : 240),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: <Widget>[
                      //useremail
                      TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                          ),
                          obscureText: false,
                          validator: validateUserEmail),
                      const SizedBox(height: 15),
                      //password
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                        ),
                        obscureText: true,
                        validator: validateUserPassword,
                      ),

                      const SizedBox(height: 15),

                      //sign in button
                      ElevatedButton(
                          onPressed: () async {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Text('SignIn'),
                          )),

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
      ),
    );
  }
}
