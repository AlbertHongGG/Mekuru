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
import 'package:mekuru/core/notifications/presentation/screens/system_log_viewer_screen.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

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
                subtitle: settingsState.dataSourceMode == 'db' ? 'DB Server' : 'Provider Source',
                onTap: () => _showModeBottomSheet(context, ref, settingsState.dataSourceMode),
              ),
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
                    notifier.updateThemeMode(val ? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              ),
              SettingsTile(
                icon: Icons.history_rounded,
                iconColor: AppColors.primary,
                title: 'APP 系統通知日誌',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SystemLogViewerScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showModeBottomSheet(BuildContext context, WidgetRef ref, String currentMode) {
    showModalBottomSheet(
      context: context,
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
                  border: Border(top: BorderSide(color: isDark ? Colors.white12 : Colors.black.withValues(alpha: 0.05))),
                ),
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 48,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.white24 : Colors.black12,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '選擇資料來源',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        InkWell(
                          onTap: () {
                            ref.read(settingsProvider.notifier).updateDataSourceMode('source');
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.cloud_outlined, color: AppColors.primary, size: 20),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Provider Source',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: isDark ? Colors.white : Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '直接請求菮箽 Comic API',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: secondaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (currentMode == 'source')
                                  const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(settingsProvider.notifier).updateDataSourceMode('db');
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.storage_outlined, color: AppColors.primary, size: 20),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DB Server',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: isDark ? Colors.white : Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '從本地竭 Library API 取得資斉',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: secondaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (currentMode == 'db')
                                  const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
                              ],
                            ),
                          ),
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
