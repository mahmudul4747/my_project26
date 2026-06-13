import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Dashboard",
      ),
      body: const Center(
        child: Text("Dashboard Screen"),
      ),
    );
  }
}