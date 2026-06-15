import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/routes/route_names.dart';
import '../providers/auth_state_provider.dart';
import 'package:go_router/go_router.dart';

class AuthWrapperPage extends ConsumerWidget {
  const AuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (user != null) {
            context.go(RouteNames.dashboard);
          } else {
            context.go(RouteNames.login);
          }
        });

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, s) => Scaffold(
        body: Center(
          child: Text(e.toString()),
        ),
      ),
    );
  }
}