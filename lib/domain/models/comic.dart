import 'package:freezed_annotation/freezed_annotation.dart';

part 'comic.freezed.dart';
part 'comic.g.dart';

@freezed
abstract class Comic with _$Comic {
  const factory Comic({
    @JsonKey(name: 'id') String? comicId,
    @JsonKey(name: 'provider_id') String? providerId,
    String? title,
    @JsonKey(name: 'cover_url') String? coverUrl,
    String? author,
    String? description,
    List<String>? tags,
    @JsonKey(name: 'update_status') String? status,
  }) = _Comic;

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);
}
