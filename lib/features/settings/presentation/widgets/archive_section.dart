import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/settings/presentation/widgets/settings_section.dart';
import 'package:mekuru/features/settings/presentation/widgets/settings_tile.dart';
import 'package:mekuru/features/archive/domain/services/archive_backup_service.dart';
import 'package:mekuru/features/archive/presentation/providers/backup_task_provider.dart';
import 'package:mekuru/features/archive/presentation/widgets/backup_task_dialog.dart';

class ArchiveSection extends ConsumerWidget {
  const ArchiveSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsSection(
      title: '封存與本地書庫',
      children: [
        SettingsTile(
          icon: Icons.archive_rounded,
          iconColor: AppColors.primary,
          title: '匯出本地書庫',
          subtitle: '將所有下載的漫畫匯出為單一檔案',
          onTap: () async {
            final String? selectedDirectory = await FilePicker.getDirectoryPath(
              dialogTitle: '選擇匯出資料夾',
            );
            if (selectedDirectory == null) return;
            
            await runWithBackupDialog(context, ref, () async {
              final service = ref.read(archiveBackupServiceProvider);
              await service.exportFullArchive(selectedDirectory);
            });
            
            final state = ref.read(backupTaskProvider);
            if (state.error != null) {
              ref.read(notificationProvider.notifier).showError('書庫匯出失敗: ${state.error}');
            } else {
              ref.read(notificationProvider.notifier).showSuccess('書庫匯出完成！');
            }
          },
        ),
        SettingsTile(
          icon: Icons.unarchive_rounded,
          iconColor: AppColors.primary,
          title: '匯入本地書庫',
          subtitle: '從 .mekuru_archive 檔案還原',
          onTap: () async {
            final PlatformFile? result = await FilePicker.pickFile(
              type: FileType.custom,
              allowedExtensions: ['mekuru_archive'],
            );

            if (result != null && result.path != null) {
              await runWithBackupDialog(context, ref, () async {
                await ref.read(archiveBackupServiceProvider).importFullArchive(result.path!);
              });
              
              final state = ref.read(backupTaskProvider);
              if (state.error != null) {
                ref.read(notificationProvider.notifier).showError('匯入失敗: ${state.error}');
              } else {
                ref.read(notificationProvider.notifier).showSuccess('本地書庫匯入成功！');
              }
            }
          },
        ),
        SettingsTile(
          icon: Icons.library_add_rounded,
          iconColor: AppColors.primary,
          title: '匯入單本漫畫',
          subtitle: '從 .mekuru_comic 檔案匯入單本漫畫',
          onTap: () async {
            final PlatformFile? result = await FilePicker.pickFile(
              type: FileType.custom,
              allowedExtensions: ['mekuru_comic'],
            );

            if (result != null && result.path != null) {
              await runWithBackupDialog(context, ref, () async {
                await ref.read(archiveBackupServiceProvider).importSingleComic(result.path!);
              });
              
              final state = ref.read(backupTaskProvider);
              if (state.error != null) {
                ref.read(notificationProvider.notifier).showError('漫畫匯入失敗: ${state.error}');
              } else {
                ref.read(notificationProvider.notifier).showSuccess('漫畫匯入成功');
              }
            }
          },
        ),
      ],
    );
  }
}
