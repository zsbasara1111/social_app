import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/auth/screens/phone_verify_screen.dart';
import '../features/auth/screens/profile_setup_screen.dart';
import '../features/auth/screens/hobby_select_screen.dart';
import '../features/main/screens/main_screen.dart';
import '../features/match/screens/match_screen.dart';
import '../features/feed/screens/feed_screen.dart';
import '../features/chat/screens/chat_list_screen.dart';
import '../features/chat/screens/chat_detail_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/profile/screens/settings_screen.dart';
import '../features/profile/screens/photo_manager_screen.dart';
import '../features/profile/screens/hobby_manager_screen.dart';
import '../features/profile/screens/match_settings_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  debugLogDiagnostics: true,
  routes: [
    // Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/verify-phone',
      builder: (context, state) {
        final phone = state.extra as String?;
        return PhoneVerifyScreen(phone: phone ?? '');
      },
    ),
    GoRoute(
      path: '/profile-setup',
      builder: (context, state) => const ProfileSetupScreen(),
    ),
    GoRoute(
      path: '/hobby-select',
      builder: (context, state) {
        final isRegistration = state.extra as bool? ?? false;
        return HobbySelectScreen(isRegistration: isRegistration);
      },
    ),

    // Main Shell Route with Bottom Navigation
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainScreen(child: child),
      routes: [
        GoRoute(
          path: '/match',
          builder: (context, state) => const MatchScreen(),
        ),
        GoRoute(
          path: '/feed',
          builder: (context, state) => const FeedScreen(),
        ),
        GoRoute(
          path: '/chat',
          builder: (context, state) => const ChatListScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),

    // Detail Routes
    GoRoute(
      path: '/chat/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId']!;
        return ChatDetailScreen(userId: userId);
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/photo-manager',
      builder: (context, state) => const PhotoManagerScreen(),
    ),
    GoRoute(
      path: '/hobby-manager',
      builder: (context, state) => const HobbyManagerScreen(),
    ),
    GoRoute(
      path: '/match-settings',
      builder: (context, state) => const MatchSettingsScreen(),
    ),
  ],
);
