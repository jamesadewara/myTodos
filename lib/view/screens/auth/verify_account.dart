import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
                key: _verifyAccountFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText('VERIFY ACCOUNT',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    AutoSizeText('Just a click to go',
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
                          activeFillColor:
                              Theme.of(context).colorScheme.surface),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      enableActiveFill: true,
                      controller: _verifyPinController,
                      appContext: context,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Expires in 58 seconds',
                    ),
                    const SizedBox(height: 64),
                    Center(
                      child: FilledButton(
                          onPressed: () async {
                            Navigator.of(context)
                                .pushNamed(AuthRoutes.addProfilePicture);
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_verifyAccountFormKey.currentState!
                                .validate()) {
                              // _emailController.dispose();
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Text('Verify'),
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
