import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
abstract class Chapter with _$Chapter {
  const factory Chapter({
    required String id,
    required String title,
    int? order,
    @JsonKey(name: 'publish_time') String? publishedAt,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}
