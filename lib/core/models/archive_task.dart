import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_task.freezed.dart';
part 'archive_task.g.dart';

@freezed
abstract class ChapterTask with _$ChapterTask {
  const factory ChapterTask({
    @JsonKey(name: 'chapter_id') required String chapterId,
    required String title,
    @Default('queued') String status,
    @JsonKey(name: 'total_pages') @Default(0) int totalPages,
    @JsonKey(name: 'downloaded_pages') @Default(0) int downloadedPages,
    @JsonKey(name: 'error_message') String? errorMessage,
  }) = _ChapterTask;

  factory ChapterTask.fromJson(Map<String, dynamic> json) => _$ChapterTaskFromJson(json);
}

@freezed
abstract class ArchiveTask with _$ArchiveTask {
  const ArchiveTask._();

  const factory ArchiveTask({
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'provider_id') required String providerId,
    @JsonKey(name: 'comic_id') required String comicId,
    @Default('queued') String status,
    @Default({}) Map<String, ChapterTask> chapters,
    @JsonKey(name: 'error_message') String? errorMessage,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ArchiveTask;

  factory ArchiveTask.fromJson(Map<String, dynamic> json) => _$ArchiveTaskFromJson(json);

  int get totalChapters => chapters.length;

  int get completedChapters => chapters.values.where((ch) => ch.status == 'completed').length;
  
  double get progress {
    if (totalChapters == 0) return 0.0;
    return completedChapters / totalChapters;
  }
  
  int get totalImages => chapters.values.fold(0, (sum, ch) => sum + ch.totalPages);
  int get downloadedImages => chapters.values.fold(0, (sum, ch) => sum + ch.downloadedPages);
  
  double get imageProgress {
    if (totalImages == 0) return 0.0;
    return downloadedImages / totalImages;
  }
}
