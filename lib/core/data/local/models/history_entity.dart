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
    required DateTime updatedAt, // 更新進度的時間
  }) = _HistoryEntity;

  factory HistoryEntity.fromJson(Map<String, dynamic> json) => 
      _$HistoryEntityFromJson(json);
}
