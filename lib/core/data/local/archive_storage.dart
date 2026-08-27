import 'dart:io';
import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mekuru/core/data/local/models/local_comic_entity.dart';
import 'package:mekuru/core/models/archive_task.dart';

abstract class ILocalLibraryStorage {
  Future<void> saveComic(LocalComicEntity comic);
  Future<List<LocalComicEntity>> getAllComics();
  Future<LocalComicEntity?> getComic(String comicId);
  Future<void> deleteComic(String comicId);
}

abstract class IArchiveTaskStorage {
  Future<void> saveTask(ArchiveTask task);
  Future<List<ArchiveTask>> getActiveTasks();
  Future<void> deleteTask(String taskId);
}

abstract class IMediaStorage {
  Future<String> saveImage(String providerId, String comicId, String chapterId, int pageIndex, Uint8List bytes, String ext);
  Future<Uint8List?> readImage(String relativePath);
  Future<void> deleteMedia(String providerId, String comicId);
}

class HiveLocalLibraryStorage implements ILocalLibraryStorage {
  final Box<dynamic> _box;

  HiveLocalLibraryStorage(this._box);

  @override
  Future<void> saveComic(LocalComicEntity comic) async {
    await _box.put(comic.comicId, comic.toJson());
  }

  @override
  Future<List<LocalComicEntity>> getAllComics() async {
    return _box.values.map((e) => LocalComicEntity.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  Future<LocalComicEntity?> getComic(String comicId) async {
    final data = _box.get(comicId);
    if (data == null) return null;
    return LocalComicEntity.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<void> deleteComic(String comicId) async {
    await _box.delete(comicId);
  }
}

class HiveArchiveTaskStorage implements IArchiveTaskStorage {
  final Box<dynamic> _box;

  HiveArchiveTaskStorage(this._box);

  @override
  Future<void> saveTask(ArchiveTask task) async {
    await _box.put(task.taskId, task.toJson());
  }

  @override
  Future<List<ArchiveTask>> getActiveTasks() async {
    return _box.values.map((e) => ArchiveTask.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await _box.delete(taskId);
  }
}

class FileSystemMediaStorage implements IMediaStorage {
  Future<Directory> _getBaseDir() async {
    final appDir = await getApplicationDocumentsDirectory();
    final archivesDir = Directory('${appDir.path}/archives');
    if (!await archivesDir.exists()) {
      await archivesDir.create(recursive: true);
    }
    return archivesDir;
  }

  @override
  Future<String> saveImage(String providerId, String comicId, String chapterId, int pageIndex, Uint8List bytes, String ext) async {
    final base = await _getBaseDir();
    final fileDir = Directory('${base.path}/$providerId/$comicId/$chapterId');
    if (!await fileDir.exists()) {
      await fileDir.create(recursive: true);
    }
    final relativePath = '$providerId/$comicId/$chapterId/$pageIndex.$ext';
    final file = File('${base.path}/$relativePath');
    await file.writeAsBytes(bytes);
    return relativePath;
  }

  @override
  Future<Uint8List?> readImage(String relativePath) async {
    final base = await _getBaseDir();
    final file = File('${base.path}/$relativePath');
    if (await file.exists()) {
      return await file.readAsBytes();
    }
    return null;
  }

  @override
  Future<void> deleteMedia(String providerId, String comicId) async {
    final base = await _getBaseDir();
    final fileDir = Directory('${base.path}/$providerId/$comicId');
    if (await fileDir.exists()) {
      await fileDir.delete(recursive: true);
    }
  }
}
