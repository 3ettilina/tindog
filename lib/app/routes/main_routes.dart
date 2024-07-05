import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tindog/app/view/auth_proxy.dart';
import 'package:tindog/app/view/home_page.dart';
import 'package:tindog/auth/auth_page.dart';
import 'package:tindog/chats/chats_page.dart';
import 'package:tindog/chats/details/chat_details_page.dart';
import 'package:tindog/discover/details/dog_details_page.dart';
import 'package:tindog/discover/discover_page.dart';
import 'package:tindog/onboarding/dog_details/add_dog_details_page.dart';
import 'package:tindog/onboarding/dog_image_selection/dog_image_selection_page.dart';
import 'package:tindog/profile/profile_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDiscoverKey =
    GlobalKey<NavigatorState>(debugLabel: 'Discover');
final _shellNavigatorChatKey = GlobalKey<NavigatorState>(debugLabel: 'Chat');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'Profile');

final routes = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: 'auth_proxy',
      path: '/',
      builder: (context, state) => const AuthProxy(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (context, state) => const DogImageSelectionPage(),
      routes: [
        GoRoute(
          name: 'dogDetails',
          path: 'dogDetails',
          builder: (context, state) => const AddDogDetailsPage(),
        ),
        GoRoute(
          name: 'location',
          path: 'location',
          builder: (context, state) => const AddDogDetailsPage(),
        )
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDiscoverKey,
          routes: [
            GoRoute(
              path: '/discover',
              name: 'discover',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DiscoverPage(
                    label: 'Dogs near', detailsPath: '/discover/dogDetails'),
              ),
              routes: [
                GoRoute(
                  path: 'dogDetails',
                  builder: (context, state) =>
                      const DogDetailsPage(label: 'Dog Details'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorChatKey,
          routes: [
            GoRoute(
              path: '/chats',
              name: 'chats',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ChatsPage(
                  label: 'Chats',
                  chatDetailsPath: '/chats/chatDetails',
                ),
              ),
              routes: [
                GoRoute(
                  path: 'chatDetails',
                  builder: (context, state) =>
                      const ChatDetailsPage(label: 'Chat Details'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(
                  label: 'Profile',
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
