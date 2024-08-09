import 'package:animex/features/home/presentation/homepage_screen.dart';
import 'package:animex/features/profile/presentation/profile_screen.dart';
import 'package:animex/features/search/presentation/search_screen.dart';
import 'package:animex/shared/bottom_navigationbar_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

//tabs kesy
final _homeTabNavigatorKey = GlobalKey<NavigatorState>();
final _profileTabNavigatorKey = GlobalKey<NavigatorState>();

//pages paths
const loginPath = '/login';
const registerPath = '/register';
const profilePath = '/profile';
const searchPath = 'search';
const homepagePath = '/homepage';


final router = GoRouter(
  initialLocation: '/homepage',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: loginPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomepageScreen()),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: registerPath,
      builder: (context, state) => const HomepageScreen(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: homepagePath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const HomepageScreen(),
                  state: state,
                );
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: searchPath,
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: const SearchScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.linear)),
                        ),
                        child: child
                      ),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileTabNavigatorKey,
          routes: [
            GoRoute(
              path: profilePath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const ProfileScreen(),
                  state: state,
                );
              },
            ),
            /*GoRoute(
              path: profileChangePasswordPath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const ChangePasswordScreen(),
                  state: state,
                );
              },
            ),*/
          ],
        ),
      ],
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return getPage(
          child: BottomNavigationPage(
            body: navigationShell,
          ),
          state: state,
        );
      },
    ),
  ],
);


Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}
