import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_task.freezed.dart';
part 'archive_task.g.dart';

enum ArchiveTaskStatus {
  @JsonValue('queued') queued,
  @JsonValue('downloading') downloading,
  @JsonValue('paused') paused,
  @JsonValue('completed') completed,
  @JsonValue('error') error,
}

@freezed
abstract class ChapterTask with _$ChapterTask {
  const factory ChapterTask({
    required String chapterId,
    required String title,
    @Default(ArchiveTaskStatus.queued) ArchiveTaskStatus status,
    @Default(0) int totalPages,
    @Default(0) int downloadedPages,
    String? errorMessage,
  }) = _ChapterTask;

  factory ChapterTask.fromJson(Map<String, dynamic> json) => _$ChapterTaskFromJson(json);
}

@freezed
@JsonSerializable(explicitToJson: true)
abstract class ArchiveTask with _$ArchiveTask {
  const ArchiveTask._();

  const factory ArchiveTask({
    required String providerId,
    required String comicId,
    @Default('') String comicTitle,
    @Default('') String coverUrl,
    @Default(ArchiveTaskStatus.queued) ArchiveTaskStatus status,
    @Default({}) Map<String, ChapterTask> chapters,
    String? errorMessage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ArchiveTask;

  factory ArchiveTask.fromJson(Map<String, dynamic> json) => _$ArchiveTaskFromJson(json);

  String get taskId => '${providerId}_$comicId';

  int get totalChapters => chapters.length;

  int get completedChapters => chapters.values.where((ch) => ch.status == ArchiveTaskStatus.completed).length;
  
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
