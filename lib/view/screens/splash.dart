import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/actions.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.surface
          ])),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icon.png",
                    width: 120,
                    height: 120,
                  )),
              Text(
                AppLocalizations.of(context)!.hello,
              ),
            ],
          ),
        ),
        floatingActionButton: StoreConnector<int, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(LoadingActions);
          },
          builder: (context, callback) {
            return FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ));
  }
}
