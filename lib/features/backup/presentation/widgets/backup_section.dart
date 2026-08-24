import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/settings/presentation/widgets/settings_section.dart';
import 'package:mekuru/features/settings/presentation/widgets/settings_tile.dart';
import 'package:mekuru/features/backup/presentation/providers/backup_provider.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';

class BackupSection extends ConsumerWidget {
  const BackupSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backupState = ref.watch(backupProvider);
    final notifier = ref.read(backupProvider.notifier);

    ref.listen<BackupState>(backupProvider, (previous, next) {
      if (next.message != null && next.message != previous?.message) {
        if (next.status == BackupStatus.error) {
          ref.read(notificationProvider.notifier).showError(next.message!);
        } else {
          ref.read(notificationProvider.notifier).showSuccess(next.message!);
        }
      }
    });

    final isExporting = backupState.status == BackupStatus.exporting;
    final isImporting = backupState.status == BackupStatus.importing;
    final isLoading = isExporting || isImporting;

    return SettingsSection(
      title: '資料備份與還原',
      children: [
        SettingsTile(
          icon: Icons.upload_file_rounded,
          iconColor: AppColors.primary,
          title: '匯出備份',
          subtitle: '將書庫與歷史紀錄打包為備份檔',
          trailing: isExporting ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: isLoading ? null : () => notifier.exportBackup(),
        ),
        SettingsTile(
          icon: Icons.download_rounded,
          iconColor: AppColors.primary,
          title: '匯入備份',
          subtitle: '從備份檔還原資料 (將覆寫現有資料)',
          trailing: isImporting ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: isLoading ? null : () => _confirmImport(context, notifier),
        ),
      ],
    );
  }

  void _confirmImport(BuildContext context, BackupNotifier notifier) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('確認還原'),
        content: const Text('這將會清空您目前的書庫與歷史紀錄，並完全被備份檔覆寫。您確定要繼續嗎？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              notifier.importBackup();
            },
            child: const Text('確定還原', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}