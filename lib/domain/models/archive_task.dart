import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_task.freezed.dart';
part 'archive_task.g.dart';

@freezed
abstract class ArchiveTask with _$ArchiveTask {
  const factory ArchiveTask({
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'provider_id') required String providerId,
    @JsonKey(name: 'comic_id') required String comicId,
    String? status,
    @Default(0.0) double progress,
  }) = _ArchiveTask;

  factory ArchiveTask.fromJson(Map<String, dynamic> json) => _$ArchiveTaskFromJson(json);
}
