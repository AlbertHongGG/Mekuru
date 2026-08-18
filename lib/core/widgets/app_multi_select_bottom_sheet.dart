import 'package:flutter/material.dart';
import 'package:mekuru/core/theme/app_colors.dart';

class AppMultiSelectBottomSheet extends StatelessWidget {
  final String title;
  final Set<String> items;
  final Set<String> selectedItems;
  final bool isExcludeMode;
  final ValueChanged<String> onToggleItem;
  final VoidCallback onToggleMode;
  final VoidCallback onClearAll;

  const AppMultiSelectBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItems,
    required this.isExcludeMode,
    required this.onToggleItem,
    required this.onToggleMode,
    required this.onClearAll,
  });

  static void show({
    required BuildContext context,
    required String title,
    required Set<String> items,
    required Set<String> selectedItems,
    required bool isExcludeMode,
    required ValueChanged<String> onToggleItem,
    required VoidCallback onToggleMode,
    required VoidCallback onClearAll,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SafeArea(
            child: AppMultiSelectBottomSheet(
              title: title,
              items: items,
              selectedItems: selectedItems,
              isExcludeMode: isExcludeMode,
              onToggleItem: onToggleItem,
              onToggleMode: onToggleMode,
              onClearAll: onClearAll,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryTextColor = isDark ? Colors.white54 : Colors.black54;
    final activeColor = isExcludeMode ? Colors.redAccent : AppColors.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Handle
        Center(
          child: Container(
            width: 48,
            height: 5,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: isDark ? Colors.white24 : Colors.black12,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ),
        // Header Row
        Stack(
          alignment: Alignment.center,
          children: [
            // Left: Mode Toggle
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: onToggleMode,
                icon: Icon(
                  isExcludeMode ? Icons.remove_circle_outline : Icons.add_circle_outline,
                  color: activeColor,
                ),
                tooltip: isExcludeMode ? '切換至包含' : '切換至排除',
              ),
            ),
            // Center: Title
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            // Right: Clear Icon
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: onClearAll,
                icon: Icon(Icons.delete_sweep_rounded, color: secondaryTextColor),
                tooltip: '清除全部',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Custom Styled Chips
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Text(
                '尚無標籤資料',
                style: TextStyle(color: secondaryTextColor),
              ),
            ),
          )
        else
          Wrap(
            spacing: 10,
            runSpacing: 12,
            children: items.map((tag) {
              final isSelected = selectedItems.contains(tag);
              return GestureDetector(
                onTap: () => onToggleItem(tag),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? activeColor 
                        : (isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.04)),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isSelected 
                          ? Colors.transparent 
                          : (isDark ? Colors.white24 : Colors.black12),
                      width: 1,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: activeColor.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ]
                        : [],
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
