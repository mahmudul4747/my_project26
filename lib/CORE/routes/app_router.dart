import 'package:go_router/go_router.dart';
import 'package:my_project26/features/menu/presentation/pages/auth_wrapper_page.dart';


import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/dashboard/presentation/pages/login_page.dart';
import '../../features/dashboard/presentation/pages/register_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import 'route_names.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteNames.authWrapper,
  routes: [
    GoRoute(
      path: RouteNames.authWrapper,
      builder: (context, state) =>
           AuthWrapperPage(),
    ),

    GoRoute(
      path: RouteNames.login,
      builder: (context, state) =>
          const LoginPage(),
    ),

    GoRoute(
      path: RouteNames.register,
      builder: (context, state) =>
          const RegisterPage(),
    ),

    GoRoute(
      path: RouteNames.dashboard,
      builder: (context, state) =>
          const DashboardPage(),
    ),

    GoRoute(
      path: RouteNames.settings,
      builder: (context, state) =>
          const SettingsPage(),
    ),
  ],
);