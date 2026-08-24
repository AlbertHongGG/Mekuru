import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_entity.freezed.dart';
part 'history_entity.g.dart';

@freezed
abstract class HistoryEntity with _$HistoryEntity {
  const factory HistoryEntity({
    required String comicId, // 關聯的 metadata ID
    required String lastReadChapterId,
    required String lastReadChapterTitle,
    required int lastReadPageIndex,
    required DateTime updatedAt, // 閱讀進度更新時間
    @Default([]) List<String> readChapterIds, // 已閱讀的章節 ID 列表
    int? lastReadChapterIndex, // 最後閱讀章節在正序列表中的索引 (0-based)
  }) = _HistoryEntity;

  factory HistoryEntity.fromJson(Map<String, dynamic> json) => 
      _$HistoryEntityFromJson(json);
}
