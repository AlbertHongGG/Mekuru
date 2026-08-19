import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@freezed
abstract class ComicPage with _$ComicPage {
  const factory ComicPage({
    @JsonKey(name: 'order') required int index,
    @JsonKey(name: 'url') required String imageUrl,
    Map<String, String>? headers,
  }) = _ComicPage;

  factory ComicPage.fromJson(Map<String, dynamic> json) => _$ComicPageFromJson(json);
}
