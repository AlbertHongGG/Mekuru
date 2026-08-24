import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/models/enums/data_source_mode.dart';

import 'package:mekuru/core/models/comic_base.dart';

part 'local_comic_record.freezed.dart';
part 'local_comic_record.g.dart';

@freezed
abstract class LocalComicRecord extends HiveObject with _$LocalComicRecord implements IComicItem {
  LocalComicRecord._();

  @HiveType(typeId: 0)
  factory LocalComicRecord({
    @HiveField(0) required String id,
    @HiveField(1) required DataSourceMode dataSourceMode,
    @HiveField(2) required String providerId,
    @HiveField(3) required String comicId,
    @HiveField(4) required String title,
    @HiveField(5) required String coverUrl,
    @HiveField(6) @Default(false) bool isFavorite,
    @HiveField(7) String? lastReadChapterId,
    @HiveField(8) String? lastReadChapterTitle,
    @HiveField(9) int? lastReadPageIndex,
    @HiveField(10) required DateTime updatedAt,
    @HiveField(11) DateTime? favoriteAt,
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
      dataSourceMode: DataSourceModeExtension.fromString(fields[1] as String),
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
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dataSourceMode.name)
      ..writeByte(2)
      ..write(obj.providerId)
      ..writeByte(3)..write(obj.comicId)
      ..writeByte(4)..write(obj.title)
      ..writeByte(5)..write(obj.coverUrl)
      ..writeByte(6)..write(obj.isFavorite)
      ..writeByte(7)..write(obj.lastReadChapterId)
      ..writeByte(8)..write(obj.lastReadChapterTitle)
      ..writeByte(9)..write(obj.lastReadPageIndex)
      ..writeByte(10)..write(obj.updatedAt)
      ..writeByte(11)..write(obj.favoriteAt?.millisecondsSinceEpoch);
  }
}
