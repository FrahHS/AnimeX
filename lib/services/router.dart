import 'package:animex/features/media/presentation/home/homepage_screen.dart';
import 'package:animex/features/media/presentation/showcase/showcase_screen.dart';
import 'package:animex/features/profile/presentation/profile_screen.dart';
import 'package:animex/features/media/presentation/search/search_screen.dart';
import 'package:animex/features/media/presentation/player/video_player.dart';
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
const homepagePath = '/homepage';
const searchPath = 'search';
const playerPath = 'player';
const showcasePath = 'showcase';
const profilePath = '/profile';


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
            //Homepage
            GoRoute(
              path: homepagePath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const HomepageScreen(),
                  state: state,
                );
              },
              routes: [
                // Search
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: searchPath,
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: const SearchScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) => _slideTransition(child, animation),
                  ),
                  routes: [
                    // Showcase
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: showcasePath,
                      pageBuilder: (context, state) => CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: const ShowcaseScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) => _slideTransition(child, animation),
                      ),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          path: playerPath,
                          builder: (context, state) => const VideoPlayerScreen(),
                        ),
                      ],
                    ),
                  ],
                ),
                // Showcase
                GoRoute(
                  parentNavigatorKey: _homeTabNavigatorKey,
                  path: showcasePath,
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: const ShowcaseScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) => _slideTransition(child, animation),
                  ),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: playerPath,
                      builder: (context, state) => const VideoPlayerScreen(),
                    ),
                  ]
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

AnimatedWidget _slideTransition(Widget child, Animation animation) {
  return SlideTransition(
    position: animation.drive(
      Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.linear)),
    ),
    child: child
  );
}
