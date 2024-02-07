import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    );
  }
}
