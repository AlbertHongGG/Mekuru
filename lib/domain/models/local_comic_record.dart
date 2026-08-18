import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'local_comic_record.freezed.dart';
part 'local_comic_record.g.dart';

@freezed
abstract class LocalComicRecord with _$LocalComicRecord {
  const factory LocalComicRecord({
    required String id,
    required String dataSourceMode,
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
  }) = _LocalComicRecord;

  factory LocalComicRecord.fromJson(Map<String, dynamic> json) => 
      _$LocalComicRecordFromJson(json);
}

class LocalComicRecordAdapter extends TypeAdapter<LocalComicRecord> {
  @override
  final int typeId = 1;

  @override
  LocalComicRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalComicRecord(
      id: fields[0] as String,
      dataSourceMode: fields[1] as String,
      providerId: fields[2] as String,
      comicId: fields[3] as String,
      title: fields[4] as String,
      coverUrl: fields[5] as String,
      isFavorite: fields[6] as bool,
      lastReadChapterId: fields[7] as String?,
      lastReadChapterTitle: fields[8] as String?,
      lastReadPageIndex: fields[9] as int?,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(fields[10] as int),
      favoriteAt: fields[11] != null ? DateTime.fromMillisecondsSinceEpoch(fields[11] as int) : null,
    );
  }

  @override
  void write(BinaryWriter writer, LocalComicRecord obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)..write(obj.id)
      ..writeByte(1)..write(obj.dataSourceMode)
      ..writeByte(2)..write(obj.providerId)
      ..writeByte(3)..write(obj.comicId)
      ..writeByte(4)..write(obj.title)
      ..writeByte(5)..write(obj.coverUrl)
      ..writeByte(6)..write(obj.isFavorite)
      ..writeByte(7)..write(obj.lastReadChapterId)
      ..writeByte(8)..write(obj.lastReadChapterTitle)
      ..writeByte(9)..write(obj.lastReadPageIndex)
      ..writeByte(10)..write(obj.updatedAt.millisecondsSinceEpoch)
      ..writeByte(11)..write(obj.favoriteAt?.millisecondsSinceEpoch);
  }
}
