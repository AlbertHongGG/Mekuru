import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mekuru/features/comic/domain/models/comic_base.dart';

part 'comic_record.freezed.dart';

@freezed
abstract class ComicRecord with _$ComicRecord implements IComicItem {
  const ComicRecord._();

  const factory ComicRecord({
    required String id,
    required String providerId,
    required String comicId,
    required String title,
    required String coverUrl,
    @Default(false) bool isFavorite,
    String? lastReadChapterId,
    String? lastReadChapterTitle,
    int? lastReadPageIndex,
    int? lastReadChapterIndex,
    required DateTime updatedAt,
    DateTime? sourceUpdatedAt,
    int? totalChapters,
    String? latestChapterTitle,
    DateTime? favoriteAt,
    DateTime? readAt,
    @Default([]) List<String> readChapterIds,
  }) = _ComicRecord;
}
