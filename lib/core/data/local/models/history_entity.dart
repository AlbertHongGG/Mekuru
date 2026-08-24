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
    required DateTime updatedAt, // 最新進度更新時間
    @Default([]) List<String> readChapterIds, // 所有看過的章節 ID 列表
  }) = _HistoryEntity;

  factory HistoryEntity.fromJson(Map<String, dynamic> json) => 
      _$HistoryEntityFromJson(json);
}
