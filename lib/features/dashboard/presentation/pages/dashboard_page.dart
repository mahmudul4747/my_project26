import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:my_project26/core/routes/route_names.dart';

import '../../../../core/widgets/app_bar_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Dashboard",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Dashboard Screen"),

            const SizedBox(height: 20),

            ElevatedButton(
 onPressed: () async {
  print("Logout Clicked");

  await FirebaseAuth.instance.signOut();

  print("User After Logout: ${FirebaseAuth.instance.currentUser}");

  if (!context.mounted) return;

  context.go('/login');

},
  child: const Text("Logout"),
)
          ],
        ),
      ),
    );
  }
}