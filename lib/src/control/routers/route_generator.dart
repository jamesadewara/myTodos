import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/inits/index.dart';
import 'package:mytodo/src/view/base.dart';

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

class MainRouteGenerator {
  static GoRouter generateRoute(
      {required AppState appState, required isLoggedIn}) {
    return GoRouter(
     // redirect: (context, state) {
   //     if (appState.isIntro) {
    //      return "/${IntroRoutes.onboarding}";
    //    } else {
    //      if (isLoggedIn) {
    //        return null;
    //      } else {
    //        return "/${AuthRoutes.login}";
      //    }
        //}
      //},
      initialLocation: "/${AppRoutes.home}",
      routes: <RouteBase>[
        // WELCOME ROUTE
        GoRoute(
          path: "/${IntroRoutes.onboarding}",
          name: IntroRoutes.onboarding,
          builder: (BuildContext context, GoRouterState state) {
            return BaseApp(
              child: OnboardingPage(),
            );
          },
        ),
        GoRoute(
          path: "/${IntroRoutes.selectAppearance}",
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
          path: "/${IntroRoutes.selectLanguage}",
          name: IntroRoutes.selectLanguage,
          builder: (BuildContext context, GoRouterState state) {
            return BaseApp(
              child: SelectLanguagePage(appState: appState, state: state),
            );
          },
        ),
        //Authentication Route
        GoRoute(
          path: "/${AuthRoutes.login}",
          name: AuthRoutes.login,
          builder: (BuildContext context, GoRouterState state) {
            return BaseApp(
              child: LoginScreen(
                  appState: appState,
                  state: state,
                  param: RouteParams(
                    id: state.pathParameters["id"].toString(),
                    path: state.pathParameters["path"].toString(),
                  )),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: AuthRoutes.forgotPassword,
              name: AuthRoutes.forgotPassword,
              builder: (BuildContext context, GoRouterState state) {
                return BaseApp(
                  child: ForgotPasswordScreen(
                      appState: appState,
                      state: state,
                      param: RouteParams(
                        id: state.pathParameters["id"].toString(),
                        path: state.pathParameters["path"].toString(),
                      )),
                );
              },
            ),
            GoRoute(
              path: AuthRoutes.resetAccount,
              name: AuthRoutes.resetAccount,
              builder: (BuildContext context, GoRouterState state) {
                return BaseApp(
                  child: ResetAccountScreen(
                      appState: appState,
                      state: state,
                      param: RouteParams(
                        id: state.pathParameters["id"].toString(),
                        path: state.pathParameters["path"].toString(),
                      )),
                );
              },
            ),
          ],
        ),
        GoRoute(
            path: "/${AuthRoutes.signup}",
            name: AuthRoutes.signup,
            builder: (BuildContext context, GoRouterState state) {
              return BaseApp(
                child: SignupScreen(
                    appState: appState,
                    state: state,
                    param: RouteParams(
                      id: state.pathParameters["id"].toString(),
                      path: state.pathParameters["path"].toString(),
                    )),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: AuthRoutes.createPassword,
                name: AuthRoutes.createPassword,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: CreatePasswordScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              ),
              GoRoute(
                path: AuthRoutes.verifyAccount,
                name: AuthRoutes.verifyAccount,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: VerifyAccountScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              ),
              GoRoute(
                path: AuthRoutes.addProfilePicture,
                name: AuthRoutes.addProfilePicture,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: AddProfilePictureScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              ),
              GoRoute(
                path: AuthRoutes.updateProfileAccount,
                name: AuthRoutes.updateProfileAccount,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: UpdateProfileAccountScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              ),
            ]),
        //Main App Route
        GoRoute(
          path: "/${AppRoutes.home}",
          name: AppRoutes.home,
          builder: (BuildContext context, GoRouterState state) {
            return BaseApp(
              child: DashboardScreen(
                  appState: appState,
                  state: state,
                  param: RouteParams(
                    id: state.pathParameters["id"].toString(),
                    path: state.pathParameters["path"].toString(),
                  )),
            );
          },
        ),
        GoRoute(
          path: "/${AppRoutes.notifications}",
          name: AppRoutes.notifications,
          builder: (BuildContext context, GoRouterState state) {
            return BaseApp(
              child: NotificationScreen(
                  appState: appState,
                  state: state,
                  param: RouteParams(
                    id: state.pathParameters["id"].toString(),
                    path: state.pathParameters["path"].toString(),
                  )),
            );
          },
        ),
        GoRoute(
            path: "/${AppRoutes.addTask}",
            name: AppRoutes.addTask,
            builder: (BuildContext context, GoRouterState state) {
              return BaseApp(
                child: AddTaskScreen(
                    appState: appState,
                    state: state,
                    param: RouteParams(
                      id: state.pathParameters["id"].toString(),
                      path: state.pathParameters["path"].toString(),
                    )),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: "${AppRoutes.task}/:id/:path",
                name: AppRoutes.task,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: TaskScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              )
            ]),
        GoRoute(
          path: "/${AppRoutes.taskGroup}",
          name: AppRoutes.taskGroup,
          builder: (BuildContext context, GoRouterState state) {
            return BaseApp(
              child: TaskGroupScreen(
                  appState: appState,
                  state: state,
                  param: RouteParams(
                    id: state.pathParameters["id"].toString(),
                    path: state.pathParameters["path"].toString(),
                  )),
            );
          },
        ),
        GoRoute(
          path: "/${AppRoutes.editor}",
          name: AppRoutes.editor,
          builder: (BuildContext context, GoRouterState state) {
            return BaseApp(
              child: TextEditor(
                  appState: appState,
                  state: state,
                  param: RouteParams(
                    id: state.pathParameters["id"].toString(),
                    path: state.pathParameters["path"].toString(),
                  )),
            );
          },
        ),
        GoRoute(
            path: "/${AppRoutes.browse}",
            name: AppRoutes.browse,
            builder: (BuildContext context, GoRouterState state) {
              return BaseApp(
                child: BrowseTasksScreen(
                    appState: appState,
                    state: state,
                    param: RouteParams(
                      id: state.pathParameters["id"].toString(),
                      path: state.pathParameters["path"].toString(),
                    )),
              );
            }),
        GoRoute(
            path: "/${AppRoutes.settings}",
            name: AppRoutes.settings,
            builder: (BuildContext context, GoRouterState state) {
              return BaseApp(
                child: SettingsScreen(
                    appState: appState,
                    state: state,
                    param: RouteParams(
                      id: state.pathParameters["id"].toString(),
                      path: state.pathParameters["path"].toString(),
                    )),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.profile,
                name: AppRoutes.profile,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: ProfileScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              ),
              GoRoute(
                path: AppRoutes.appLanguages,
                name: AppRoutes.appLanguages,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: LanguageScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
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
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              ),
              GoRoute(
                path: AppRoutes.appNotification,
                name: AppRoutes.appNotification,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: NotificationSettingsScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              ),
              GoRoute(
                path: AppRoutes.accountManagement,
                name: AppRoutes.accountManagement,
                builder: (BuildContext context, GoRouterState state) {
                  return BaseApp(
                    child: AccountManagementScreen(
                        appState: appState,
                        state: state,
                        param: RouteParams(
                          id: state.pathParameters["id"].toString(),
                          path: state.pathParameters["path"].toString(),
                        )),
                  );
                },
              ),
            ]),
      ],
    );
  }
}
