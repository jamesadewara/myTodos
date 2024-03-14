import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_framework/responsive_framework.dart';

class VerifyAccountScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const VerifyAccountScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

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

    return Scaffold(
        body: SafeArea(
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
                      context.tr("verifyAccountText"),
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                    const SizedBox(height: 4),
                    AutoSizeText(
                      context.tr("verifyAccountDescriptionText"),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true,
                    ),
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
                      context.tr("expiresText",
                          namedArgs: {"value": 7.toString()}),
                      softWrap: true,
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
                              context.tr("verifyText"),
                              softWrap: true,
                            ),
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
    )));
  }
}
