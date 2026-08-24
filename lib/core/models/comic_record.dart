import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mekuru/core/models/enums/data_source_mode.dart';
import 'package:mekuru/core/models/comic_base.dart';

part 'comic_record.freezed.dart';

@freezed
abstract class ComicRecord with _$ComicRecord implements IComicItem {
  const ComicRecord._();

  const factory ComicRecord({
    required String id,
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
    required String title,
    required String coverUrl,
    @Default(false) bool isFavorite,
    String? lastReadChapterId,
    String? lastReadChapterTitle,
    int? lastReadPageIndex,
    required DateTime updatedAt,
    DateTime? favoriteAt,
    DateTime? readAt,
  }) = _ComicRecord;
}
