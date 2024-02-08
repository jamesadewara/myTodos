import 'package:aiauth_sdk/main.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/index.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String home = '/';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var isLogged = false;

    if (!isLogged) {
      return MaterialPageRoute(
          builder: (_) => authSdkInit(image: "assets/icon.png"));
    }

    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: SplashScreen(),
                ));

      case AppRoutes.intro:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: IntroScreen(),
                ));

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const ErrorPage();
    });
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Oops'),
      ),
      body: const Center(
        child: Text(
          'Oops, something went wrong. Please try again or go back to your previous page',
          softWrap: true,
        ),
      ),
    );
  }
}

class BaseApp extends StatefulWidget {
  const BaseApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widget.child);
  }
}
