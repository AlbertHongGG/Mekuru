import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/archive/presentation/providers/backup_task_provider.dart';

Future<void> runWithBackupDialog(BuildContext context, WidgetRef ref, Future<void> Function() task) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          content: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(backupTaskProvider);
              if (!state.isWorking && (state.progress == 1.0 || state.error != null)) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                });
              }
              
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(state.message, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: state.progress > 0 ? state.progress : null),
                  const SizedBox(height: 8),
                  Text('${(state.progress * 100).toStringAsFixed(1)}%'),
                ],
              );
            },
          ),
        ),
      );
    },
  );

  try {
    await task();
  } catch (e) {
    // Error is handled by provider, dialog closes.
  }
}
