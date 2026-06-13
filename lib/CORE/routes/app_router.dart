import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/menu/presentation/pages/menu_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';

import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.dashboard,
  routes: [
    GoRoute(
      path: RouteNames.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: RouteNames.menu,
      builder: (context, state) => const MenuPage(),
    ),
    GoRoute(
      path: RouteNames.orders,
      builder: (context, state) => const OrdersPage(),
    ),
    GoRoute(
      path: RouteNames.settings,
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);