import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:my_project26/core/routes/route_names.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    ref.read(authLoadingProvider.notifier).state = true;

    final result = await ref.read(authProvider).login(
          emailController.text.trim(),
          passwordController.text.trim(),
        );

    ref.read(authLoadingProvider.notifier).state = false;

    if (!mounted) return;

    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Success"),
        ),
      );

      context.go(RouteNames.dashboard);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Failed"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(authLoadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: emailController,
              hintText: "Email",
            ),

            const SizedBox(height: 16),

            CustomTextField(
              controller: passwordController,
              hintText: "Password",
            ),

            const SizedBox(height: 20),

            loading
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: "Login",
                    onPressed: login,
                  ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                context.push(RouteNames.register);
              },
              child: const Text(
                "Don't have an account? Register",
              ),
            ),
          ],
        ),
      ),
    );
  }
}