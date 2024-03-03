import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateProfileAccountScreen extends StatefulWidget {
  const UpdateProfileAccountScreen({super.key});

  @override
  State<UpdateProfileAccountScreen> createState() =>
      _UpdateProfileAccountScreenState();
}

class _UpdateProfileAccountScreenState
    extends State<UpdateProfileAccountScreen> {
  final _updateProfileAccountFormKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _usernameController = TextEditingController();
  final _aboutController = TextEditingController();

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
                key: _updateProfileAccountFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                        AppLocalizations.of(context)!.updateProfileText,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium),
                    AutoSizeText(AppLocalizations.of(context)!.addProfileText,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 64),
                    Text(AppLocalizations.of(context)!.usernameText("")),
                    TextFormField(
                      controller: _usernameController,
                      maxLength: 255,
                      keyboardType: TextInputType.text,
                      validator: validateUserName,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.usernameHint,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      AppLocalizations.of(context)!.aboutText,
                    ),
                    TextFormField(
                      maxLength: 255,
                      maxLines: null,
                      controller: _aboutController,
                      keyboardType: TextInputType.text,
                      validator: validateField,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.aboutHint,
                      ),
                    ),
                    const SizedBox(height: 64),
                    Center(
                      child: FilledButton(
                          onPressed: () async {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_updateProfileAccountFormKey.currentState!
                                .validate()) {
                              // _emailController.dispose();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
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
