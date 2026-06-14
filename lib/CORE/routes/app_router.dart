import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project26/features/dashboard/presentation/pages/login_page.dart';
import 'package:my_project26/features/dashboard/presentation/pages/register_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import 'route_names.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteNames.login,

  /*redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final loggingIn = state.matchedLocation == RouteNames.login;

    if (user == null) {
      return RouteNames.login;
    }

    if (user != null && loggingIn) {
      return RouteNames.dashboard;
    }

    return null;
  },*/

  routes: [GoRoute(
  path: '/register',
  builder: (context, state) => const RegisterPage(),
),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);