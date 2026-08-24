import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:mekuru/features/logger/presentation/providers/logger_provider.dart';

class SystemLogView extends ConsumerWidget {
  const SystemLogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(systemLogsProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
      data: (logs) {
        if (logs.isEmpty) {
          return const Center(child: Text('No System Logs Found.'));
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
                      ref.read(systemLogsProvider.notifier).clearLogs();
                    },
                    icon: const Icon(Icons.delete_sweep_rounded),
                    label: const Text('Clear System Logs'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final log = logs[index] as SystemLogEntry;

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: ListTile(
                      leading: const Icon(Icons.info_outline_rounded),
                      title: Text(log.eventType),
                      subtitle: Text('${log.timestamp.toLocal()}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {
                          // Show details
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Log Details'),
                              content: SingleChildScrollView(
                                child: Text(log.data.toString()),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                )
                              ],
                            ),
                          );
                        },
                      ),
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
}
