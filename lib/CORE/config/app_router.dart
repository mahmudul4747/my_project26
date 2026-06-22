import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:my_project26/features/admin/pressentation/pages/admin_dashboard_page.dart';
import 'package:my_project26/features/auth/presentation/pages/home_page.dart';
import 'package:my_project26/features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/login',

  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null && state.matchedLocation != '/login') {
      return '/login';
    }

    if (user != null && state.matchedLocation == '/login') {
      return '/home';
    }

    return null;
  },

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
      path: '/admin',
      builder: (context, state) => const AdminDashboardPage(),
    ),
  ],
);