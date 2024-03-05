import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final _verifyAccountFormKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _verifyPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      if (_verifyAccountFormKey.currentState!.validate()) {
        GoRouter.of(context).pushNamed(AuthRoutes.addProfilePicture);
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
                key: _verifyAccountFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                        AppLocalizations.of(context)!.verifyAccountText,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    AutoSizeText(
                        AppLocalizations.of(context)!
                            .verifyAccountDescriptionText,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 32),
                    PinCodeTextField(
                      length: 4,
                      obscureText: false,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderWidth: 2,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 64,
                          fieldWidth: 64,
                          selectedColor:
                              Theme.of(context).colorScheme.background,
                          activeFillColor:
                              Theme.of(context).colorScheme.surface),
                      enableActiveFill: true,
                      controller: _verifyPinController,
                      appContext: context,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      AppLocalizations.of(context)!.expiresText(7.toString()),
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
                            child:
                                Text(AppLocalizations.of(context)!.verifyText),
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
