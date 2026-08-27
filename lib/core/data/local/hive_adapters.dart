import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';

class HiveAdapters {
  static void registerAll() {
    Hive.registerAdapter(ComicMetadataEntityAdapter());
    Hive.registerAdapter(FavoriteEntityAdapter());
    Hive.registerAdapter(HistoryEntityAdapter());
    Hive.registerAdapter(ApiLogEntryAdapter());
    Hive.registerAdapter(SystemLogEntryAdapter());
  }
}



class ComicMetadataEntityAdapter extends TypeAdapter<ComicMetadataEntity> {
  @override
  final int typeId = 2;

  @override
  ComicMetadataEntity read(BinaryReader reader) {
    final id = reader.readString();
        final providerId = reader.readString();
    final comicId = reader.readString();
    final title = reader.readString();
    final coverUrl = reader.readString();
    final updatedAt = DateTime.fromMillisecondsSinceEpoch(reader.readInt());

    DateTime? sourceUpdatedAt;
    int? totalChapters;
    String? latestChapterTitle;

    final sourceUpdatedEpoch = reader.readInt();
    if (sourceUpdatedEpoch != 0) {
      sourceUpdatedAt = DateTime.fromMillisecondsSinceEpoch(sourceUpdatedEpoch);
    }
    
    final total = reader.readInt();
    if (total != -1) {
      totalChapters = total;
    }
    
    final latest = reader.readString();
    if (latest.isNotEmpty) {
      latestChapterTitle = latest;
    }

    return ComicMetadataEntity(
      id: id,
            providerId: providerId,
      comicId: comicId,
      title: title,
      coverUrl: coverUrl,
      updatedAt: updatedAt,
      sourceUpdatedAt: sourceUpdatedAt,
      totalChapters: totalChapters,
      latestChapterTitle: latestChapterTitle,
    );
  }

  @override
  void write(BinaryWriter writer, ComicMetadataEntity obj) {
    writer
      ..writeString(obj.id)
            ..writeString(obj.providerId)
      ..writeString(obj.comicId)
      ..writeString(obj.title)
      ..writeString(obj.coverUrl)
      ..writeInt(obj.updatedAt.millisecondsSinceEpoch)
      ..writeInt(obj.sourceUpdatedAt?.millisecondsSinceEpoch ?? 0)
      ..writeInt(obj.totalChapters ?? -1)
      ..writeString(obj.latestChapterTitle ?? '');
  }
}

class FavoriteEntityAdapter extends TypeAdapter<FavoriteEntity> {
  @override
  final int typeId = 3;

  @override
  FavoriteEntity read(BinaryReader reader) {
    return FavoriteEntity(
      comicId: reader.readString(),
      favoriteAt: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteEntity obj) {
    writer
      ..writeString(obj.comicId)
      ..writeInt(obj.favoriteAt.millisecondsSinceEpoch);
  }
}

class HistoryEntityAdapter extends TypeAdapter<HistoryEntity> {
  @override
  final int typeId = 4;

  @override
  HistoryEntity read(BinaryReader reader) {
    final comicId = reader.readString();
    final lastReadChapterId = reader.readString();
    final lastReadChapterTitle = reader.readString();
    final lastReadPageIndex = reader.readInt();
    final updatedAt = DateTime.fromMillisecondsSinceEpoch(reader.readInt());

    List<String> readChapterIds = [];
    int? lastReadChapterIndex;
    try {
      readChapterIds = reader.readStringList();
      final index = reader.readInt();
      if (index != -1) {
        lastReadChapterIndex = index;
      }
    } catch (_) {
      // Backward compatibility for existing data
    }

    return HistoryEntity(
      comicId: comicId,
      lastReadChapterId: lastReadChapterId,
      lastReadChapterTitle: lastReadChapterTitle,
      lastReadPageIndex: lastReadPageIndex,
      updatedAt: updatedAt,
      readChapterIds: readChapterIds,
      lastReadChapterIndex: lastReadChapterIndex,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryEntity obj) {
    writer
      ..writeString(obj.comicId)
      ..writeString(obj.lastReadChapterId)
      ..writeString(obj.lastReadChapterTitle)
      ..writeInt(obj.lastReadPageIndex)
      ..writeInt(obj.updatedAt.millisecondsSinceEpoch)
      ..writeStringList(obj.readChapterIds)
      ..writeInt(obj.lastReadChapterIndex ?? -1);
  }
}

class ApiLogEntryAdapter extends TypeAdapter<ApiLogEntry> {
  @override
  final int typeId = 5;

  @override
  ApiLogEntry read(BinaryReader reader) {
    return ApiLogEntry(
      id: reader.readString(),
      method: reader.readString(),
      url: reader.readString(),
      timestamp: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      requestHeaders: Map<String, dynamic>.from(jsonDecode(reader.readString())),
      requestBody: jsonDecode(reader.readString()),
      statusCode: reader.readBool() ? reader.readInt() : null,
      responseHeaders: reader.readBool() ? Map<String, dynamic>.from(jsonDecode(reader.readString())) : null,
      responseBody: reader.readBool() ? jsonDecode(reader.readString()) : null,
      responseTime: reader.readBool() ? DateTime.fromMillisecondsSinceEpoch(reader.readInt()) : null,
      error: reader.readBool() ? reader.readString() : null,
    );
  }

  String _safeEncode(dynamic obj) {
    if (obj == null) return 'null';
    try {
      return jsonEncode(obj);
    } catch (_) {
      return '"<Unencodable data: ${obj.runtimeType}>"';
    }
  }

  @override
  void write(BinaryWriter writer, ApiLogEntry obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.method)
      ..writeString(obj.url)
      ..writeInt(obj.timestamp.millisecondsSinceEpoch)
      ..writeString(_safeEncode(obj.requestHeaders))
      ..writeString(_safeEncode(obj.requestBody))
      ..writeBool(obj.statusCode != null);
    if (obj.statusCode != null) writer.writeInt(obj.statusCode!);

    writer.writeBool(obj.responseHeaders != null);
    if (obj.responseHeaders != null) writer.writeString(_safeEncode(obj.responseHeaders));

    writer.writeBool(obj.responseBody != null);
    if (obj.responseBody != null) writer.writeString(_safeEncode(obj.responseBody));

    writer.writeBool(obj.responseTime != null);
    if (obj.responseTime != null) writer.writeInt(obj.responseTime!.millisecondsSinceEpoch);

    writer.writeBool(obj.error != null);
    if (obj.error != null) writer.writeString(obj.error!);
  }
}

class SystemLogEntryAdapter extends TypeAdapter<SystemLogEntry> {
  @override
  final int typeId = 6;

  @override
  SystemLogEntry read(BinaryReader reader) {
    return SystemLogEntry(
      id: reader.readString(),
      eventType: reader.readString(),
      timestamp: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      data: jsonDecode(reader.readString()),
    );
  }

  String _safeEncode(dynamic obj) {
    if (obj == null) return 'null';
    try {
      return jsonEncode(obj);
    } catch (_) {
      return '"<Unencodable data: ${obj.runtimeType}>"';
    }
  }

  @override
  void write(BinaryWriter writer, SystemLogEntry obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.eventType)
      ..writeInt(obj.timestamp.millisecondsSinceEpoch)
      ..writeString(_safeEncode(obj.data));
  }
}
