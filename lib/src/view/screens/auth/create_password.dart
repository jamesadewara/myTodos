import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/control/constants/validators.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CreatePasswordScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const CreatePasswordScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

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
    void handleSubmit() {
      if (_createPasswordFormKey.currentState!.validate()) {
        GoRouter.of(context).pushNamed(AuthRoutes.verifyAccount);
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
                key: _createPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      context.tr("createPasswordText"),
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                    const SizedBox(height: 4),
                    AutoSizeText(
                      context.tr("patienceText"),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true,
                    ),
                    const SizedBox(height: 64),
                    Text(
                      context.tr("passwordText"),
                      softWrap: true,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        return validateUserPassword(value, context: context);
                      },
                      onFieldSubmitted: (value) {
                        handleSubmit();
                      },
                      decoration: InputDecoration(
                        hintText: context.tr("passwordHint"),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      context.tr("confirmPasswordText"),
                      softWrap: true,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        return validateUserPasswordConfirmation(
                            value, _passwordController.text,
                            context: context);
                      },
                      onFieldSubmitted: (value) {
                        handleSubmit();
                      },
                      decoration: InputDecoration(
                        hintText: context.tr("confirmPasswordHint"),
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
                              context.tr("continueText"),
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
