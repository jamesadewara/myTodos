import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      if (_forgotPasswordFormKey.currentState!.validate()) {
        GoRouter.of(context).pushNamed(AuthRoutes.resetAccount);
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
          child: Column(children: [
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
                key: _forgotPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                        AppLocalizations.of(context)!.forgottenPasswordText,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium),
                    AutoSizeText(
                        AppLocalizations.of(context)!.recoverWithEmailText,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 64),
                    Text(
                      AppLocalizations.of(context)!.emailText,
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
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.emailHint,
                      ),
                    ),
                    const SizedBox(height: 64),
                    Center(
                      child: FilledButton(
                          onPressed: () async {
                            handleSubmit();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
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
