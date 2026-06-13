import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleAsync = ref.watch(dashboardTitleProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: titleAsync.when(
          data: (title) => Text(title),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
      ),
    );
  }
}