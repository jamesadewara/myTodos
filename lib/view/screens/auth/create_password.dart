import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final _createPasswordFormKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
          child: Column(children: [
            const SizedBox(height: 50),
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
                key: _createPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                        AppLocalizations.of(context)!.createPasswordText,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    AutoSizeText(AppLocalizations.of(context)!.patienceText,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 64),
                    Text(AppLocalizations.of(context)!.passwordText),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: validateUserPassword,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.passwordHint,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      AppLocalizations.of(context)!.confirmPasswordText,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return AppLocalizations.of(context)!
                              .validatePasswordText;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.confirmPasswordHint,
                      ),
                    ),
                    const SizedBox(height: 64),
                    Center(
                      child: FilledButton(
                          onPressed: () async {
                            Navigator.of(context)
                                .pushNamed(AuthRoutes.verifyAccount);
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_createPasswordFormKey.currentState!
                                .validate()) {
                              // _emailController.dispose();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Text(
                                AppLocalizations.of(context)!.continueText),
                          )),
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
