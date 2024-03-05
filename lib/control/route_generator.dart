import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:mytodo/index.dart';
import 'package:mytodo/view/screens/base.dart';

class AppRoutes {
  static const String home = 'home';
  static const String notifications = 'notifications';
  static const String task = 'task';
  static const String taskGroup = 'task/group';
  static const String addTask = 'task/add';
  static const String editor = 'note_editor';
  static const String browse = 'browse';
  static const String settings = 'settings';
  static const String profile = 'settings/profile';
  static const String appLanguages = 'settings/app_languages';
  static const String appAppearances = 'settings/app_appearances';
  static const String appNotification = 'settings/app_notification';
  static const String accountManagement = 'settings/account_management';
}

class AuthRoutes {
  static const String signup = 'signup';
  static const String login = 'login';
  static const String forgotPassword = 'forgot_password';
  static const String resetAccount = 'reset_account';
  static const String createPassword = 'create_password';
  static const String verifyAccount = 'verify_account';
  static const String addProfilePicture = 'add_profile_picture';
  static const String updateProfileAccount = 'update_profile_account';
}

class IntroRoutes {
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String selectAppearance = 'select-appearance';
  static const String selectLanguage = 'select-language';
}

class IntroRouteGenerator {
  static GoRouter generateRoute({required AppState appState}) {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          name: IntroRoutes.splash,
          builder: (BuildContext context, GoRouterState state) {
            return const BaseApp(
              child: SplashScreen(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: IntroRoutes.onboarding,
              name: IntroRoutes.onboarding,
              builder: (BuildContext context, GoRouterState state) {
                return BaseApp(
                  child: OnboardingPage(),
                );
              },
            ),
            GoRoute(
              path: IntroRoutes.selectAppearance,
              name: IntroRoutes.selectAppearance,
              builder: (BuildContext context, GoRouterState state) {
                return BaseApp(
                  child: SelectAppearancePage(
                    appState: appState,
                    state: state,
                  ),
                );
              },
            ),
            GoRoute(
              path: IntroRoutes.selectLanguage,
              name: IntroRoutes.selectLanguage,
              builder: (BuildContext context, GoRouterState state) {
                return BaseApp(
                  child: SelectLanguagePage(appState: appState, state: state),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class AuthRouteGenerator {
  static GoRouter generateRoute({required AppState appState}) {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          name: AuthRoutes.login,
          builder: (BuildContext context, GoRouterState state) {
            return const BaseApp(
              child: LoginScreen(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: AuthRoutes.forgotPassword,
              name: AuthRoutes.forgotPassword,
              builder: (BuildContext context, GoRouterState state) {
                return const BaseApp(
                  child: ForgotPasswordScreen(),
                );
              },
            ),
            GoRoute(
              path: AuthRoutes.resetAccount,
              name: AuthRoutes.resetAccount,
              builder: (BuildContext context, GoRouterState state) {
                return const BaseApp(
                  child: ResetAccountScreen(),
                );
              },
            ),
          ],
        ),
        GoRoute(
            path: "/${AuthRoutes.signup}",
            name: AuthRoutes.signup,
            builder: (BuildContext context, GoRouterState state) {
              return const BaseApp(
                child: SignupScreen(),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: AuthRoutes.createPassword,
                name: AuthRoutes.createPassword,
                builder: (BuildContext context, GoRouterState state) {
                  return const BaseApp(
                    child: CreatePasswordScreen(),
                  );
                },
              ),
              GoRoute(
                path: AuthRoutes.verifyAccount,
                name: AuthRoutes.verifyAccount,
                builder: (BuildContext context, GoRouterState state) {
                  return const BaseApp(
                    child: VerifyAccountScreen(),
                  );
                },
              ),
              GoRoute(
                path: AuthRoutes.addProfilePicture,
                name: AuthRoutes.addProfilePicture,
                builder: (BuildContext context, GoRouterState state) {
                  return const BaseApp(
                    child: AddProfilePictureScreen(),
                  );
                },
              ),
              GoRoute(
                path: AuthRoutes.updateProfileAccount,
                name: AuthRoutes.updateProfileAccount,
                builder: (BuildContext context, GoRouterState state) {
                  return const BaseApp(
                    child: UpdateProfileAccountScreen(),
                  );
                },
              ),
            ]),
      ],
    );
  }
}

class AppRouteGenerator {
  static GoRouter generateRoute({required AppState appState}) {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          name: AppRoutes.home,
          builder: (BuildContext context, GoRouterState state) {
            return const BaseApp(
              child: HomeScreen(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.notifications,
              name: AppRoutes.notifications,
              builder: (BuildContext context, GoRouterState state) {
                return const BaseApp(
                  child: NotificationScreen(),
                );
              },
            ),
            GoRoute(
                path: AppRoutes.task,
                name: AppRoutes.task,
                builder: (BuildContext context, GoRouterState state) {
                  return const BaseApp(
                    child: TaskScreen(),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoutes.taskGroup,
                    name: AppRoutes.taskGroup,
                    builder: (BuildContext context, GoRouterState state) {
                      return const BaseApp(
                        child: TaskGroupScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: AppRoutes.addTask,
                    name: AppRoutes.addTask,
                    builder: (BuildContext context, GoRouterState state) {
                      return const BaseApp(
                        child: AddTaskScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: AppRoutes.editor,
                    name: AppRoutes.editor,
                    builder: (BuildContext context, GoRouterState state) {
                      return const BaseApp(
                        child: TextEditor(),
                      );
                    },
                  )
                ]),
            GoRoute(
                path: AppRoutes.browse,
                name: AppRoutes.browse,
                builder: (BuildContext context, GoRouterState state) {
                  return const BaseApp(
                    child: BrowseTasksScreen(),
                  );
                }),
            GoRoute(
                path: AppRoutes.settings,
                name: AppRoutes.settings,
                builder: (BuildContext context, GoRouterState state) {
                  return const BaseApp(
                    child: SettingsScreen(),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoutes.profile,
                    name: AppRoutes.profile,
                    builder: (BuildContext context, GoRouterState state) {
                      return const BaseApp(
                        child: ProfileScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: AppRoutes.appLanguages,
                    name: AppRoutes.appLanguages,
                    builder: (BuildContext context, GoRouterState state) {
                      return const BaseApp(
                        child: LanguageScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: AppRoutes.appAppearances,
                    name: AppRoutes.appAppearances,
                    builder: (BuildContext context, GoRouterState state) {
                      return BaseApp(
                        child: AppearanceScreen(
                          appState: appState,
                          state: state,
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: AppRoutes.appNotification,
                    name: AppRoutes.appNotification,
                    builder: (BuildContext context, GoRouterState state) {
                      return const BaseApp(
                        child: NotificationSettingsScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: AppRoutes.accountManagement,
                    name: AppRoutes.accountManagement,
                    builder: (BuildContext context, GoRouterState state) {
                      return const BaseApp(
                        child: AccountManagementScreen(),
                      );
                    },
                  ),
                ]),
          ],
        ),
      ],
    );
  }
}
