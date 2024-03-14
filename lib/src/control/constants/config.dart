import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo/src/control/constants/app_localization/app_locales.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/view/components/login_dialog.dart';

const appName = "myTodo's";
const appSite = "myTodo's";
const appVersion = "1.0.0";
const appLegalese = "copyright 2024 ceoCompany";

List<AppLocale> supportedLocales = [
  AppLocale(locale: const Locale('en', 'US'), name: "English"),
  AppLocale(locale: const Locale('fr', 'FR'), name: "French"),
  AppLocale(locale: const Locale('yo', 'NG'), name: "Yoruba"),
  AppLocale(locale: const Locale('ig', 'NG'), name: "Igbo"),
  AppLocale(locale: const Locale('ha', 'NG'), name: "Hausa"),
];

List<ThemeProps> themeList({required BuildContext context}) => [
      ThemeProps(
          id: "system",
          value: context.tr("appearanceSystemTitle"),
          image: "assets/images/bg/system.png"),
      ThemeProps(
          id: "light",
          value: context.tr("appearanceLightTitle"),
          image: "assets/images/bg/light.png"),
      ThemeProps(
          id: "dark",
          value: context.tr("appearanceDarkTitle"),
          image: "assets/images/bg/dark.png"),
    ];

List<NavBtnProps> iconList({required BuildContext context}) => [
      NavBtnProps(
          id: "0",
          icon: Icons.home_outlined,
          selectedIcon: Icons.home,
          label: context.tr("homeTitle"),
          route: AppRoutes.home),
      NavBtnProps(
          id: "1",
          icon: Icons.event_outlined,
          selectedIcon: Icons.event,
          label: context.tr("taskTitle"),
          route: AppRoutes.task),
      NavBtnProps(
          id: "2",
          icon: Icons.find_in_page_outlined,
          selectedIcon: Icons.find_in_page,
          label: context.tr("browseTitle"),
          route: AppRoutes.browse),
      NavBtnProps(
          id: "3",
          icon: Icons.group_outlined,
          selectedIcon: Icons.group,
          label: context.tr("settingsTitle"),
          route: AppRoutes.settings),
    ];

List<SettingsTitleRouteProps> settingsList({required BuildContext context}) => [
      SettingsTitleRouteProps(
        title: context.tr("accountText"),
        children: [
          SettingsRouteProps(
              id: "profile",
              icon: Icons.person,
              title: context.tr("profileText"),
              subtitle: null,
              goRoute: () {
                GoRouter.of(context).pushNamed(AppRoutes.profile);
              },
              trailingIcon: Icons.chevron_right),
          SettingsRouteProps(
              icon: Icons.refresh,
              title: context.tr("resetAccountText"),
              subtitle: null,
              goRoute: () {},
              trailingIcon: Icons.chevron_right),
          SettingsRouteProps(
              icon: Icons.delete_outline,
              title: context.tr("accountManagementTitle"),
              subtitle: null,
              goRoute: () {
                GoRouter.of(context).pushNamed(AppRoutes.accountManagement);
              },
              trailingIcon: Icons.chevron_right),
          SettingsRouteProps(
              icon: Icons.logout,
              title: context.tr("logoutText"),
              subtitle: null,
              goRoute: () {
                const LoginDialog();
              },
              trailingIcon: Icons.chevron_right),
        ],
      ),
      SettingsTitleRouteProps(title: context.tr("preferencesText"), children: [
        SettingsRouteProps(
            icon: Icons.notifications_none,
            title: context.tr("notificationTitle"),
            subtitle: null,
            goRoute: () {
              GoRouter.of(context).pushNamed(AppRoutes.appNotification);
            },
            trailingIcon: Icons.chevron_right),
        SettingsRouteProps(
            icon: Icons.palette,
            title: context.tr("appearanceTitle"),
            subtitle: null,
            goRoute: () {
              GoRouter.of(context).pushNamed(AppRoutes.appAppearances);
            },
            trailingIcon: Icons.chevron_right),
        SettingsRouteProps(
            icon: Icons.language,
            title: context.tr("languageTitle"),
            subtitle: null,
            goRoute: () {
              GoRouter.of(context).pushNamed(AppRoutes.appLanguages);
            },
            trailingIcon: Icons.chevron_right),
      ]),
      SettingsTitleRouteProps(title: '', children: [
        SettingsRouteProps(
            icon: Icons.feedback,
            title: context.tr("feedbackTitle"),
            subtitle: null,
            goRoute: () {},
            trailingIcon: Icons.chevron_right),
        SettingsRouteProps(
            id: "about",
            icon: Icons.help,
            title: context.tr("aboutAppTitle"),
            subtitle: "1.0.0",
            goRoute: () {
              showAboutDialog(context: context);
            },
            trailingIcon: Icons.chevron_right),
      ]),
    ];
