import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mekuru/domain/models/comic.dart';

part 'paginated_comics.freezed.dart';
part 'paginated_comics.g.dart';

@freezed
abstract class PaginatedComics with _$PaginatedComics {
  const factory PaginatedComics({
    @Default([]) List<Comic> comics,
    @Default(1) int page,
    @Default(false) bool hasNext,
  }) = _PaginatedComics;

  factory PaginatedComics.fromJson(Map<String, dynamic> json) => _$PaginatedComicsFromJson(json);
}
