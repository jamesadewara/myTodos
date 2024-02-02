import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/page_list.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: SplashScreen(),
                ));

      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: LoginScreen(),
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
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      StoreConnector<bool, bool>(
        converter: (store) => store.state,
        builder: (context, value) {
          return Visibility(
              visible: value,
              child: LinearProgressIndicator(value: value ? null : 0));
        },
      ),
      Expanded(child: widget.child)
    ]);
  }
}
