import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_names.dart';
import '../providers/user_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final userProfile =
        ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: userProfile.when(
        data: (user) {
          if (user == null) {
            return const Center(
              child: Text("User Not Found"),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Email: ${user.email}",
                ),

                const SizedBox(height: 10),

                Text(
                  "Role: ${user.role}",
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth
                        .instance
                        .signOut();

                    if (!context.mounted)
                      return;

                    context.go(
                      RouteNames.login,
                    );
                  },
                  child:
                      const Text("Logout"),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child:
              CircularProgressIndicator(),
        ),
        error: (e, s) => Center(
          child: Text(e.toString()),
        ),
      ),
    );
  }
}