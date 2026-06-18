import 'package:go_router/go_router.dart';

import 'package:my_project26/features/auth/presentation/pages/login_page.dart';
import 'package:my_project26/features/auth/presentation/pages/register_page.dart';
import 'package:my_project26/features/auth/presentation/pages/home_page.dart';
import 'package:my_project26/features/cart/presentation/pages/cart_page.dart';



final GoRouter appRouter = GoRouter(
  initialLocation: '/login',

  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
  ],
);