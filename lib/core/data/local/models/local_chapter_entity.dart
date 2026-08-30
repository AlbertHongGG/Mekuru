import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_chapter_entity.freezed.dart';
part 'local_chapter_entity.g.dart';

@freezed
abstract class LocalChapterEntity with _$LocalChapterEntity {
  const factory LocalChapterEntity({
    required String chapterId,
    required String title,
    required DateTime archivedAt,
  }) = _LocalChapterEntity;

  factory LocalChapterEntity.fromJson(Map<String, dynamic> json) => 
      _$LocalChapterEntityFromJson(json);
}