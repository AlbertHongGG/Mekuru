import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/logger/presentation/pages/api_log_view.dart';
import 'package:mekuru/features/logger/presentation/pages/system_log_view.dart';

class LoggerDashboardPage extends ConsumerWidget {
  const LoggerDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DevTools - Logs'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'API Logs'),
              Tab(text: 'System Logs'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ApiLogView(),
            SystemLogView(),
          ],
        ),
      ),
    );
  }
}
