import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/features/settings/presentation/widgets/settings_section.dart';
import 'package:mekuru/features/settings/presentation/widgets/settings_tile.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/immersive_scaffold.dart';
import 'package:mekuru/core/widgets/premium_config_header.dart';
import 'package:mekuru/core/widgets/app_switch.dart';
import 'package:mekuru/core/widgets/app_bottom_sheet.dart';
import 'package:mekuru/features/comic/data/sources/provider_registry.dart';
import 'package:mekuru/features/logger/presentation/pages/system_log_viewer_screen.dart';
import 'package:mekuru/features/logger/presentation/pages/api_log_list_page.dart';
import 'package:mekuru/features/backup/presentation/widgets/backup_section.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  String _getProviderName(WidgetRef ref, String providerId) {
    try {
      final registry = ref.read(providerRegistryProvider);
      return registry.getProvider(providerId).providerName;
    } catch (e) {
      return providerId;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return ImmersiveScaffold(
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: [
          const PremiumConfigHeader(
            title: '進階設定',
            subtitle: 'SYSTEM CONFIGURATION',
          ),
          SettingsSection(
            title: '系統',
            children: [
              SettingsTile(
                icon: Icons.api_rounded,
                iconColor: AppColors.primary,
                title: '來源選擇',
                subtitle: _getProviderName(ref, settingsState.currentSourceId),
                onTap: () => _showSourceProviderBottomSheet(context, ref, settingsState.currentSourceId),
              ),
              SettingsTile(
                icon: Icons.dark_mode_rounded,
                iconColor: AppColors.primary,
                title: '深色主題',
                trailing: AppSwitch(
                  value: settingsState.themeMode == ThemeMode.dark,
                  onChanged: (val) {
                    notifier.updateTheme(val ? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SettingsSection(
            title: '日誌與效能',
            children: [
              SettingsTile(
                icon: Icons.bug_report_rounded,
                iconColor: AppColors.primary,
                title: '紀錄 API 日誌',
                subtitle: '除錯用，開啟會影響下載效能',
                trailing: AppSwitch(
                  value: settingsState.enableApiLogging,
                  onChanged: (val) {
                    notifier.toggleApiLogging(val);
                  },
                ),
              ),
              SettingsTile(
                icon: Icons.developer_board_rounded,
                iconColor: AppColors.primary,
                title: '紀錄系統日誌',
                subtitle: '紀錄系統錯誤與背景事件',
                trailing: AppSwitch(
                  value: settingsState.enableSystemLogging,
                  onChanged: (val) {
                    notifier.toggleSystemLogging(val);
                  },
                ),
              ),
              SettingsTile(
                icon: Icons.history_rounded,
                iconColor: AppColors.primary,
                title: 'APP 系統日誌列表',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SystemLogViewerScreen()),
                  );
                },
              ),
              SettingsTile(
                icon: Icons.network_ping_rounded,
                iconColor: AppColors.primary,
                title: 'API 網路日誌列表',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ApiLogListPage()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          const BackupSection(),
        ],
      ),
    );
  }

  void _showSourceProviderBottomSheet(BuildContext context, WidgetRef ref, String currentSourceId) {
    final registry = ref.read(providerRegistryProvider);
    final providers = registry.getAllProviders();
    
    // Auto generate items from registry
    final items = providers.map((provider) {
      IconData icon;
      switch (provider.providerId) {
        case 'comicwf':
          icon = Icons.wifi;
          break;
        case 'webtoon':
          icon = Icons.web;
          break;
        case 'copymg':
          icon = Icons.library_books;
          break;
        case 'local':
          icon = Icons.download_done;
          break;
        default:
          icon = Icons.extension;
      }
      return AppBottomSheetItemData(
        title: provider.providerName,
        leadingIcon: icon,
        value: provider.providerId,
      );
    }).toList();

    AppBottomSheet.show(
      context: context,
      title: '選擇漫畫來源',
      items: items,
      selectedValue: currentSourceId,
      onItemSelected: (val) {
        ref.read(settingsProvider.notifier).updateCurrentSourceId(val);
      },
    );
  }
}
