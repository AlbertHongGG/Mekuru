import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:mekuru/features/archive/domain/models/archive_task.dart';
import 'package:mekuru/core/data/local/models/local_comic_entity.dart';
import 'package:mekuru/core/data/local/models/local_chapter_entity.dart';

class HiveAdapters {
  static void registerAll() {
    Hive.registerAdapter(ComicMetadataEntityAdapter());
    Hive.registerAdapter(FavoriteEntityAdapter());
    Hive.registerAdapter(HistoryEntityAdapter());
    Hive.registerAdapter(ApiLogEntryAdapter());
    Hive.registerAdapter(SystemLogEntryAdapter());
    Hive.registerAdapter(ArchiveTaskStatusAdapter());
    Hive.registerAdapter(ChapterTaskAdapter());
    Hive.registerAdapter(ArchiveTaskAdapter());
    Hive.registerAdapter(LocalChapterEntityAdapter());
    Hive.registerAdapter(LocalComicEntityAdapter());
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


class ArchiveTaskStatusAdapter extends TypeAdapter<ArchiveTaskStatus> {
  @override
  final int typeId = 9;

  @override
  ArchiveTaskStatus read(BinaryReader reader) {
    return ArchiveTaskStatus.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, ArchiveTaskStatus obj) {
    writer.writeInt(obj.index);
  }
}

class ChapterTaskAdapter extends TypeAdapter<ChapterTask> {
  @override
  final int typeId = 8;

  @override
  ChapterTask read(BinaryReader reader) {
    final chapterId = reader.readString();
    final title = reader.readString();
    final status = reader.read();
    final totalPages = reader.readInt();
    final downloadedPages = reader.readInt();
    final errorMessage = reader.readBool() ? reader.readString() : null;
    
    final archivedAt = reader.readBool() ? DateTime.fromMillisecondsSinceEpoch(reader.readInt()) : null;

    return ChapterTask(
      chapterId: chapterId,
      title: title,
      status: status,
      totalPages: totalPages,
      downloadedPages: downloadedPages,
      errorMessage: errorMessage,
      archivedAt: archivedAt,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterTask obj) {
    writer
      ..writeString(obj.chapterId)
      ..writeString(obj.title)
      ..write(obj.status)
      ..writeInt(obj.totalPages)
      ..writeInt(obj.downloadedPages)
      ..writeBool(obj.errorMessage != null);
    if (obj.errorMessage != null) writer.writeString(obj.errorMessage!);
    
    writer.writeBool(obj.archivedAt != null);
    if (obj.archivedAt != null) writer.writeInt(obj.archivedAt!.millisecondsSinceEpoch);
  }
}

class ArchiveTaskAdapter extends TypeAdapter<ArchiveTask> {
  @override
  final int typeId = 7;

  @override
  ArchiveTask read(BinaryReader reader) {
    final providerId = reader.readString();
    final comicId = reader.readString();
    final comicTitle = reader.readString();
    final coverUrl = reader.readString();
    final status = reader.read(); // Uses ArchiveTaskStatusAdapter
    final chaptersMap = reader.readMap().cast<String, ChapterTask>();
    final errorMessage = reader.readBool() ? reader.readString() : null;
    final createdAt = reader.readBool() ? DateTime.fromMillisecondsSinceEpoch(reader.readInt()) : null;
    final updatedAt = reader.readBool() ? DateTime.fromMillisecondsSinceEpoch(reader.readInt()) : null;

    return ArchiveTask(
      providerId: providerId,
      comicId: comicId,
      comicTitle: comicTitle,
      coverUrl: coverUrl,
      status: status,
      chapters: chaptersMap,
      errorMessage: errorMessage,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  void write(BinaryWriter writer, ArchiveTask obj) {
    writer
      ..writeString(obj.providerId)
      ..writeString(obj.comicId)
      ..writeString(obj.comicTitle)
      ..writeString(obj.coverUrl)
      ..write(obj.status)
      ..writeMap(obj.chapters)
      ..writeBool(obj.errorMessage != null);
    if (obj.errorMessage != null) writer.writeString(obj.errorMessage!);

    writer.writeBool(obj.createdAt != null);
    if (obj.createdAt != null) writer.writeInt(obj.createdAt!.millisecondsSinceEpoch);

    writer.writeBool(obj.updatedAt != null);
    if (obj.updatedAt != null) writer.writeInt(obj.updatedAt!.millisecondsSinceEpoch);
  }
}

class LocalComicEntityAdapter extends TypeAdapter<LocalComicEntity> {
  @override
  final int typeId = 10;

  @override
  LocalComicEntity read(BinaryReader reader) {
    final providerId = reader.readString();
    final comicId = reader.readString();
    final title = reader.readString();
    final coverUrl = reader.readString();
    final tags = reader.readStringList();
    final author = reader.readString();
    final description = reader.readString();
    final chapterIds = reader.readStringList();
    final archivedAt = DateTime.fromMillisecondsSinceEpoch(reader.readInt());

    final hasChapters = reader.readBool();
    final chaptersList = hasChapters ? reader.readList() : [];
    final chapters = chaptersList.cast<LocalChapterEntity>();

    return LocalComicEntity(
      providerId: providerId,
      comicId: comicId,
      title: title,
      coverUrl: coverUrl,
      tags: tags,
      author: author,
      description: description,
      chapterIds: chapterIds,
      chapters: chapters,
      archivedAt: archivedAt,
    );
  }

  @override
  void write(BinaryWriter writer, LocalComicEntity obj) {
    writer
      ..writeString(obj.providerId)
      ..writeString(obj.comicId)
      ..writeString(obj.title)
      ..writeString(obj.coverUrl)
      ..writeStringList(obj.tags)
      ..writeString(obj.author)
      ..writeString(obj.description)
      ..writeStringList(obj.chapterIds)
      ..writeInt(obj.archivedAt.millisecondsSinceEpoch);
      
    writer.writeBool(true);
    writer.writeList(obj.chapters);
  }
}

class LocalChapterEntityAdapter extends TypeAdapter<LocalChapterEntity> {
  @override
  final int typeId = 11;

  @override
  LocalChapterEntity read(BinaryReader reader) {
    final chapterId = reader.readString();
    final title = reader.readString();
    final ms = reader.readInt();
    return LocalChapterEntity(
      chapterId: chapterId,
      title: title,
      archivedAt: ms == 0 ? null : DateTime.fromMillisecondsSinceEpoch(ms),
    );
  }

  @override
  void write(BinaryWriter writer, LocalChapterEntity obj) {
    writer
      ..writeString(obj.chapterId)
      ..writeString(obj.title)
      ..writeInt(obj.archivedAt?.millisecondsSinceEpoch ?? 0);
  }
}
