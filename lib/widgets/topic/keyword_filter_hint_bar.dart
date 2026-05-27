import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/s.dart';
import '../../settings/definitions/preferences_defs.dart';

/// 话题列表顶部的「关键词过滤」提示条。
///
/// 仅在有话题被隐藏时显示。点击右侧「管理」按钮打开关键词编辑弹窗。
class KeywordFilterHintBar extends ConsumerWidget {
  final int hiddenCount;

  const KeywordFilterHintBar({super.key, required this.hiddenCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (hiddenCount <= 0) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Material(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => showTopicFilterKeywordsDialog(context, ref),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 8, 6),
            child: Row(
              children: [
                Icon(
                  Icons.filter_alt_off_rounded,
                  size: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.topic_keywordFilter_hiddenCount(hiddenCount),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: const Size(0, 28),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                  onPressed: () => showTopicFilterKeywordsDialog(context, ref),
                  child: Text(l10n.topic_keywordFilter_manage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
