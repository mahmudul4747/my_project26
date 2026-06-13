import 'package:flutter/material.dart';
import 'package:my_project26/features/dashboard/presentation/pages/dashboard_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Manager',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: const DashboardPage(),
    );
  }
}

