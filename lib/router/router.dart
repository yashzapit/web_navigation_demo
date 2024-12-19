import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_navigation_demo/components/sidebar.dart';
import 'package:web_navigation_demo/components/topbar.dart';
import 'package:web_navigation_demo/screens/dashboard.dart';
import 'package:web_navigation_demo/main.dart';
import 'package:web_navigation_demo/screens/profile_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    // ShellRoute for entire app
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: Row(
            children: [
              const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    const Topbar(),
                    Expanded(child: child),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      routes: [
        // Main Dashboard Route
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardPage(),
        ),

        // Profile Section ShellRoute
        ShellRoute(
          builder: (context, state, child) {
            return ProfilePage(child: child);
          },
          routes: [
            GoRoute(
              path: '/profile/user-settings',
              builder: (context, state) => const UserSettingsContent(),
            ),
            GoRoute(
              path: '/profile/security',
              builder: (context, state) => const SecurityContent(),
            ),
            GoRoute(
              path: '/profile/personalization',
              builder: (context, state) => const PersonalizationContent(),
            ),
            GoRoute(
              path: '/profile/referral',
              builder: (context, state) => const ReferralContent(),
            ),
            GoRoute(
              path: '/profile/tools',
              builder: (context, state) => const ToolsContent(),
            ),
            GoRoute(
              path: '/profile/notifications',
              builder: (context, state) => const NotificationsContent(),
            ),
            GoRoute(
              path: '/profile/connected-sites',
              builder: (context, state) => const ConnectedSitesContent(),
            ),
          ],
        ),

        // Other Main Routes (e.g., Settings, About)
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutPage(),
        ),
      ],
    ),
  ],
);

