import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:mekuru/features/logger/presentation/providers/logger_provider.dart';

class ApiLogView extends ConsumerWidget {
  const ApiLogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(apiLogsProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
      data: (logs) {
        if (logs.isEmpty) {
          return const Center(child: Text('No API Logs Found.'));
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      ref.read(apiLogsProvider.notifier).clearLogs();
                    },
                    icon: const Icon(Icons.delete_sweep_rounded),
                    label: const Text('Clear API Logs'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final log = logs[index] as ApiLogEntry;
                  final color = _getStatusColor(log.statusCode);

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: ExpansionTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          log.method,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(log.url, maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(
                        '${log.statusCode ?? '???'} | ${log.durationMs != null ? '${log.durationMs}ms' : 'Pending'} | ${log.timestamp.toLocal()}',
                      ),
                      children: [
                        if (log.error != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Error: ${log.error}', style: const TextStyle(color: Colors.red)),
                          ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Response Body: (See full details in future expansion)', style: TextStyle(color: Colors.grey)),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getStatusColor(int? statusCode) {
    if (statusCode == null) return Colors.grey;
    if (statusCode >= 200 && statusCode < 300) return Colors.green;
    if (statusCode >= 300 && statusCode < 400) return Colors.orange;
    if (statusCode >= 400 && statusCode < 500) return Colors.redAccent;
    return Colors.red;
  }
}
