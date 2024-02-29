import 'package:flutter/material.dart';
import 'package:mytodo/control/config.dart';
import 'package:mytodo/control/notifier_listener.dart';
import 'package:mytodo/index.dart';
import 'package:mytodo/view/components/dropdown_modal.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String home = '/';
  static const String notifications = '/notifications';
  static const String task = '/task';
  static const String taskGroup = '/task/group';
  static const String addTask = '/task/add';
  static const String editor = '/note_editor';
  static const String browse = '/browse';
  static const String settings = '/settings';
  static const String profile = '/settings/profile';
  static const String appLanguages = '/settings/app_languages';
  static const String appAppearances = '/settings/app_appearances';
  static const String appNotification = '/settings/app_notification';
  static const String accountManagement = '/settings/account_management';
}

class AuthRoutes {
  static const String signup = '/signup';
  static const String login = '/login';
  static const String forgotPassword = '/forgot_password';
  static const String resetAccount = '/reset_account';
  static const String createPassword = '/create_password';
  static const String verifyAccount = '/verify_account';
  static const String addProfilePicture = '/add_profile_picture';
  static const String updateProfileAccount = '/update_profile_account';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (!isLogged) {
      switch (settings.name) {
        case AuthRoutes.signup:
          return MaterialPageRoute(
              builder: (_) => const BaseApp(
                    child: SignupScreen(),
                  ));
        case AuthRoutes.login:
          return MaterialPageRoute(
              builder: (_) => const BaseApp(
                    child: LoginScreen(),
                  ));
        case AuthRoutes.forgotPassword:
          return MaterialPageRoute(
              builder: (_) => const BaseApp(
                    child: ForgotPasswordScreen(),
                  ));
        case AuthRoutes.resetAccount:
          return MaterialPageRoute(
              builder: (_) => const BaseApp(
                    child: ResetAccountScreen(),
                  ));
        case AuthRoutes.createPassword:
          return MaterialPageRoute(
              builder: (_) => const BaseApp(
                    child: CreatePasswordScreen(),
                  ));
        case AuthRoutes.verifyAccount:
          return MaterialPageRoute(
              builder: (_) => const BaseApp(
                    child: VerifyAccountScreen(),
                  ));
        case AuthRoutes.addProfilePicture:
          return MaterialPageRoute(
              builder: (_) => const BaseApp(
                    child: AddProfilePictureScreen(),
                  ));
        case AuthRoutes.updateProfileAccount:
          return MaterialPageRoute(
              builder: (_) => const BaseApp(
                    child: UpdateProfileAccountScreen(),
                  ));
      }
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

      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: HomeScreen(),
                ));
      case AppRoutes.notifications:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: NotificationScreen(),
                ));

      case AppRoutes.task:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: TaskScreen(),
                ));
      case AppRoutes.taskGroup:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: TaskGroupScreen(),
                ));
      case AppRoutes.addTask:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: AddTaskScreen(),
                ));
      case AppRoutes.editor:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: TextEditor(),
                ));
      case AppRoutes.browse:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: BrowseTasksScreen(),
                ));
      case AppRoutes.settings:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: SettingsScreen(),
                ));
      case AppRoutes.profile:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: ProfileScreen(),
                ));
      case AppRoutes.appLanguages:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: LanguageScreen(),
                ));
      case AppRoutes.appAppearances:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: AppearanceScreen(),
                ));
      case AppRoutes.appNotification:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: NotificationSettingsScreen(),
                ));
      case AppRoutes.accountManagement:
        return MaterialPageRoute(
            builder: (_) => const BaseApp(
                  child: AccountManagementScreen(),
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
       bool listener = context.watch<NotifyListener>();
       listener.isLoading?  showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ProgressModal(message: listener.message);});
    return Scaffold(body: widget.child);
  }
}
