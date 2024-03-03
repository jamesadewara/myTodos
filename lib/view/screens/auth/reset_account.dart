import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetAccountScreen extends StatefulWidget {
  const ResetAccountScreen({super.key});

  @override
  State<ResetAccountScreen> createState() => _ResetAccountScreenState();
}

class _ResetAccountScreenState extends State<ResetAccountScreen> {
  final _resetAccountFormKey = GlobalKey<FormState>();
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
                key: _resetAccountFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                        AppLocalizations.of(context)!.resetPasswordText,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium),
                    AutoSizeText(
                        AppLocalizations.of(context)!.choosePasswordText,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 64),
                    Text(
                      AppLocalizations.of(context)!.newPasswordText,
                    ),
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
                    Text(AppLocalizations.of(context)!.confirmPasswordText),
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
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_resetAccountFormKey.currentState!.validate()) {
                              // _emailController.dispose();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child:
                                Text(AppLocalizations.of(context)!.submitText),
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
