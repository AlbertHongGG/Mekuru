import 'dart:ui';
import 'package:mekuru/core/models/enums/data_source_mode.dart';
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
import 'package:mekuru/core/data/sources/provider_registry.dart';
import 'package:mekuru/core/notifications/presentation/screens/system_log_viewer_screen.dart';
import 'package:mekuru/core/network/presentation/pages/api_log_list_page.dart';
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
            title: '偏好設定',
            subtitle: 'SYSTEM CONFIGURATION',
          ),
            SettingsSection(
              title: '系統',
              children: [
                SettingsTile(
                  icon: Icons.source,
                  iconColor: AppColors.primary,
                  title: '資料來源模式',
                  subtitle: settingsState.dataSourceMode.label,
                  onTap: () => _showModeBottomSheet(context, ref, settingsState.dataSourceMode),
                ),
                if (settingsState.dataSourceMode == DataSourceMode.source)
                  SettingsTile(
                    icon: Icons.api_rounded,
                    iconColor: AppColors.primary,
                    title: '來源選擇',
                    subtitle: _getProviderName(ref, settingsState.currentSourceId),
                    onTap: () => _showSourceProviderBottomSheet(context, ref, settingsState.currentSourceId),
                  ),
                if (settingsState.dataSourceMode == DataSourceMode.db)
                  SettingsTile(
                    icon: Icons.link,
                    iconColor: AppColors.primary,
                    title: '伺服器網址',
                    subtitle: settingsState.serverUrl,
                    onTap: () => _showUrlBottomSheet(context, ref, settingsState.serverUrl),
                  ),
                SettingsTile(
                  icon: Icons.dark_mode_rounded,
                  iconColor: AppColors.primary,
                  title: '深色模式',
                  trailing: AppSwitch(
                  value: settingsState.themeMode == ThemeMode.dark,
                  onChanged: (val) {
                    notifier.updateTheme(val ? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              ),
              SettingsTile(
                icon: Icons.history_rounded,
                iconColor: AppColors.primary,
                title: 'APP 系統日誌',
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
                title: 'API 網路日誌',
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

  void _showModeBottomSheet(BuildContext context, WidgetRef ref, DataSourceMode currentMode) {
    AppBottomSheet.show(
      context: context,
      title: '選擇資料來源模式',
      items: [
        AppBottomSheetItemData(
          title: 'Provider Source',
          subtitle: '直接透過 App 連線到各大漫畫源',
          leadingIcon: Icons.cloud_outlined,
          value: DataSourceMode.source,
        ),
        AppBottomSheetItemData(
          title: 'DB Server',
          subtitle: '從本地端 Library API 取得資料',
          leadingIcon: Icons.storage_outlined,
          value: DataSourceMode.db,
        ),
      ],
      selectedValue: currentMode,
      onItemSelected: (val) {
        ref.read(settingsProvider.notifier).updateDataSourceMode(val);
      },
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

  void _showUrlBottomSheet(BuildContext context, WidgetRef ref, String currentUrl) {
    final controller = TextEditingController(text: currentUrl);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        final isDark = theme.brightness == Brightness.dark;
        final secondaryTextColor = isDark ? Colors.white54 : Colors.black54;

        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  border: Border(top: BorderSide(color: isDark ? Colors.white12 : Colors.black.withOpacity(0.05))),
                ),
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Drag Handle
                        Container(
                          width: 48,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.white24 : Colors.black12,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                        // Header with Title and Done Icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 48), // Spacer for centering
                            Text(
                              '設定伺服器網址',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                final newUrl = controller.text.trim();
                                if (newUrl.isNotEmpty) {
                                  ref.read(settingsProvider.notifier).updateServerUrl(newUrl);
                                }
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.check_circle_rounded),
                              color: theme.primaryColor,
                              iconSize: 28,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Content
                        TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: '網址',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          keyboardType: TextInputType.url,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
