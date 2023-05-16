import 'package:flutter/material.dart';
import 'package:flutter_starter/page/home/page.dart';
import 'package:flutter_starter/page/main/page.dart';
import 'package:flutter_starter/page/user/index/page.dart';
import 'package:flutter_starter/page/user/user_info/page.dart';
import 'package:flutter_starter/page/wallet/page.dart';
import 'package:go_router/go_router.dart';

class RoutePaths {
  static String main = '/';
  static String home = '/home';
  static String wallet = '/wallet';
  static String user = '/user';
  static String userInfo([String? id]) =>
      id != null ? '/user/$id' : '/user/:id';
}

final appRouter = GoRouter(
  initialLocation: RoutePaths.main,
  routes: [
    AppRoute(
      RoutePaths.main,
      (state) => const MainPage(),
    ),
    AppRoute(
      RoutePaths.home,
      (state) => const HomePage(),
    ),
    AppRoute(
      RoutePaths.wallet,
      (state) => const WalletPage(),
    ),
    AppRoute(
      RoutePaths.user,
      (state) => const UserPage(),
    ),
    AppRoute(
      RoutePaths.userInfo(),
      (state) => UserInfo(id: state.params['id']!),
    ),
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return MaterialPage(child: pageContent);
          },
        );
  final bool useFade;
}
