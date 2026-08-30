import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:archive/archive_io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/archive/domain/models/archive_task.dart';
import 'package:mekuru/features/archive/data/sources/archive_storage.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';
import 'package:mekuru/core/data/local/models/local_comic_entity.dart';
import 'package:mekuru/features/archive/domain/managers/i_local_library_manager.dart';
import 'package:mekuru/features/archive/domain/managers/local_library_manager.dart';
import 'package:mekuru/features/archive/domain/services/archive_download_service.dart';
import 'package:mekuru/features/archive/presentation/providers/backup_task_provider.dart';
import 'package:path/path.dart' as p;

class _ExportFullArgs {
  final String destinationPath;
  final String libraryJson;
  final String tasksJson;
  final String baseMediaDir;
  final SendPort sendPort;
  _ExportFullArgs(this.destinationPath, this.libraryJson, this.tasksJson, this.baseMediaDir, this.sendPort);
}

class _ExportSingleArgs {
  final String destinationPath;
  final String metadataJson;
  final String? taskJson;
  final String mediaSourceDir;
  final SendPort sendPort;
  _ExportSingleArgs(this.destinationPath, this.metadataJson, this.taskJson, this.mediaSourceDir, this.sendPort);
}

class _ImportFullArgs {
  final String zipFilePath;
  final String baseMediaDir;
  final SendPort sendPort;
  _ImportFullArgs(this.zipFilePath, this.baseMediaDir, this.sendPort);
}

class _ImportFullResult {
  final String libraryJson;
  final String tasksJson;
  _ImportFullResult(this.libraryJson, this.tasksJson);
}

class _ImportSingleArgs {
  final String zipFilePath;
  final String baseMediaDir;
  final SendPort sendPort;
  _ImportSingleArgs(this.zipFilePath, this.baseMediaDir, this.sendPort);
}

class _ImportSingleResult {
  final String metadataJson;
  final String? taskJson;
  _ImportSingleResult(this.metadataJson, this.taskJson);
}

Future<void> _exportFullArchiveInIsolate(_ExportFullArgs args) async {
  try {
    final encoder = ZipFileEncoder();
    encoder.create(args.destinationPath);
    
    encoder.addArchiveFile(ArchiveFile.string('library.json', args.libraryJson));
    encoder.addArchiveFile(ArchiveFile.string('tasks.json', args.tasksJson));
    
    final dir = Directory(args.baseMediaDir);
    if (dir.existsSync()) {
      final files = dir.listSync(recursive: true).whereType<File>().toList();
      int total = files.length;
      int current = 0;
      
      for (final file in files) {
        final relativePath = p.relative(file.path, from: args.baseMediaDir);
        final zipPath = 'media/${relativePath.replaceAll('\\', '/')}';
        encoder.addFile(file, zipPath);
        
        current++;
        if (current % 10 == 0 || current == total) {
          args.sendPort.send({'progress': current / total, 'message': '壓縮圖檔中: $current / $total'});
        }
      }
    }
    
    encoder.close();
  } catch (e) {
    throw Exception('Isolate Export Error: $e');
  }
}

Future<void> _exportSingleComicInIsolate(_ExportSingleArgs args) async {
  try {
    final encoder = ZipFileEncoder();
    encoder.create(args.destinationPath);
    
    encoder.addArchiveFile(ArchiveFile.string('metadata.json', args.metadataJson));
    if (args.taskJson != null) {
      encoder.addArchiveFile(ArchiveFile.string('task_snapshot.json', args.taskJson!));
    }
    
    final dir = Directory(args.mediaSourceDir);
    if (dir.existsSync()) {
      final files = dir.listSync(recursive: true).whereType<File>().toList();
      int total = files.length;
      int current = 0;
      
      for (final file in files) {
        final relativePath = p.relative(file.path, from: args.mediaSourceDir);
        final zipPath = 'media/${relativePath.replaceAll('\\', '/')}';
        encoder.addFile(file, zipPath);
        
        current++;
        if (current % 5 == 0 || current == total) {
          args.sendPort.send({'progress': current / total, 'message': '壓縮圖檔中: $current / $total'});
        }
      }
    }
    
    encoder.close();
  } catch (e) {
    throw Exception('Isolate Export Error: $e');
  }
}

Future<_ImportFullResult> _importFullArchiveInIsolate(_ImportFullArgs args) async {
  final inputStream = InputFileStream(args.zipFilePath);
  final archive = ZipDecoder().decodeStream(inputStream);
  
  String libraryJson = '';
  String tasksJson = '';
  
  int total = archive.files.length;
  int current = 0;
  
  for (final file in archive.files) {
    current++;
    if (current % 10 == 0 || current == total) {
      args.sendPort.send({'progress': current / total, 'message': '解壓縮中: $current / $total'});
    }
    
    if (file.isFile) {
      if (file.name == 'library.json') {
        libraryJson = utf8.decode(file.content as List<int>);
      } else if (file.name == 'tasks.json') {
        tasksJson = utf8.decode(file.content as List<int>);
      } else if (file.name.startsWith('media/')) {
        final relativePath = file.name.substring(6);
        final outPath = p.join(args.baseMediaDir, relativePath);
        final outFile = File(outPath);
        outFile.parent.createSync(recursive: true);
        
        final outStream = OutputFileStream(outPath);
        file.writeContent(outStream);
        outStream.close();
      }
    }
  }
  
  inputStream.close();
  return _ImportFullResult(libraryJson, tasksJson);
}

Future<_ImportSingleResult> _importSingleComicInIsolate(_ImportSingleArgs args) async {
  final inputStream = InputFileStream(args.zipFilePath);
  final archive = ZipDecoder().decodeStream(inputStream);
  
  final metadataFile = archive.findFile('metadata.json');
  if (metadataFile == null) throw Exception('metadata.json not found');
  final metadataJson = utf8.decode(metadataFile.content as List<int>);
  final metadataMap = jsonDecode(metadataJson);
  final providerId = metadataMap['providerId'] as String;
  final comicId = metadataMap['comicId'] as String;
  
  final taskFile = archive.findFile('task_snapshot.json');
  final taskJson = taskFile != null ? utf8.decode(taskFile.content as List<int>) : null;
  
  final destMediaDir = p.join(args.baseMediaDir, providerId, comicId);
  
  int total = archive.files.length;
  int current = 0;
  
  for (final file in archive.files) {
    current++;
    if (current % 5 == 0 || current == total) {
      args.sendPort.send({'progress': current / total, 'message': '解壓縮圖檔中: $current / $total'});
    }
    
    if (file.isFile && file.name.startsWith('media/')) {
      final relativePath = file.name.substring(6);
      final outPath = p.join(destMediaDir, relativePath);
      final outFile = File(outPath);
      outFile.parent.createSync(recursive: true);
      
      final outStream = OutputFileStream(outPath);
      file.writeContent(outStream);
      outStream.close();
    }
  }
  
  inputStream.close();
  return _ImportSingleResult(metadataJson, taskJson);
}

class ArchiveBackupService {
  final ILocalLibraryManager _libraryManager;
  final IMediaStorage _mediaStorage;
  final IArchiveTaskStorage _taskStorage;
  final ArchiveDownloadService _downloadService;
  final Ref _ref;

  ArchiveBackupService(this._libraryManager, this._mediaStorage, this._taskStorage, this._downloadService, this._ref);

  Future<File> exportSingleComic(String providerId, String comicId, String destinationPath) async {
    _ref.read(backupTaskProvider.notifier).start('準備單本漫畫...');
    
    final comic = await _libraryManager.getComic(comicId);
    if (comic == null) throw Exception('Comic not found');

    final tasks = await _taskStorage.getActiveTasks();
    final task = tasks.where((t) => t.comicId == comicId).firstOrNull;

    final mediaDir = await _mediaStorage.getComicDirectory(providerId, comicId);
    
    final receivePort = ReceivePort();
    receivePort.listen((message) {
      if (message is Map<String, dynamic> && message.containsKey('progress')) {
        _ref.read(backupTaskProvider.notifier).updateProgress(message['progress'], message['message']);
      }
    });

    try {
      final sendPort = receivePort.sendPort;
      final comicJsonStr = jsonEncode(comic.toJson());
      final taskJsonStr = task != null ? jsonEncode(task.toJson()) : null;
      
      await compute(_exportSingleComicInIsolate, _ExportSingleArgs(
        destinationPath,
        comicJsonStr,
        taskJsonStr,
        mediaDir,
        sendPort,
      ));
      
      _ref.read(backupTaskProvider.notifier).finish('匯出完成');
      return File(destinationPath);
    } catch (e) {
      _ref.read(backupTaskProvider.notifier).fail(e.toString());
      rethrow;
    } finally {
      receivePort.close();
    }
  }

  Future<void> importSingleComic(String zipFilePath) async {
    _ref.read(backupTaskProvider.notifier).start('讀取備份檔...');
    
    final receivePort = ReceivePort();
    receivePort.listen((message) {
      if (message is Map<String, dynamic> && message.containsKey('progress')) {
        _ref.read(backupTaskProvider.notifier).updateProgress(message['progress'], message['message']);
      }
    });

    try {
      final baseMediaDir = await _mediaStorage.getBaseDirectory();
      
      final sendPort = receivePort.sendPort;
      final result = await compute(_importSingleComicInIsolate, _ImportSingleArgs(
        zipFilePath,
        baseMediaDir,
        sendPort,
      ));
      
      _ref.read(backupTaskProvider.notifier).updateProgress(1.0, '註冊漫畫資料...');
      
      final metadataJson = jsonDecode(result.metadataJson);
      final comic = LocalComicEntity.fromJson(metadataJson);
      await _libraryManager.saveComic(comic);

      if (result.taskJson != null) {
        final taskJson = jsonDecode(result.taskJson!);
        final task = ArchiveTask.fromJson(taskJson);
        await _taskStorage.saveTask(task);
        await _downloadService.reloadTasksFromStorage();
      }
      
      _ref.read(backupTaskProvider.notifier).finish('匯入完成');
    } catch (e) {
      _ref.read(backupTaskProvider.notifier).fail(e.toString());
      rethrow;
    } finally {
      receivePort.close();
    }
  }

  Future<File> exportFullArchive(String destinationPath) async {
    _ref.read(backupTaskProvider.notifier).start('讀取書庫資料...');
    
    final comics = await _libraryManager.getAllComics();
    final comicsJson = comics.map((c) => c.toJson()).toList();

    final tasks = await _taskStorage.getActiveTasks();
    final tasksJson = tasks.map((t) => t.toJson()).toList();

    final baseMediaDir = await _mediaStorage.getBaseDirectory();
    
    final receivePort = ReceivePort();
    receivePort.listen((message) {
      if (message is Map<String, dynamic> && message.containsKey('progress')) {
        _ref.read(backupTaskProvider.notifier).updateProgress(message['progress'], message['message']);
      }
    });

    try {
      final sendPort = receivePort.sendPort;
      final comicsJsonStr = jsonEncode(comicsJson);
      final tasksJsonStr = jsonEncode(tasksJson);
      
      await compute(_exportFullArchiveInIsolate, _ExportFullArgs(
        destinationPath,
        comicsJsonStr,
        tasksJsonStr,
        baseMediaDir,
        sendPort,
      ));
      
      _ref.read(backupTaskProvider.notifier).finish('書庫匯出完成');
      return File(destinationPath);
    } catch (e) {
      _ref.read(backupTaskProvider.notifier).fail(e.toString());
      rethrow;
    } finally {
      receivePort.close();
    }
  }

  Future<void> importFullArchive(String zipFilePath) async {
    _ref.read(backupTaskProvider.notifier).start('準備解壓縮書庫...');
    
    final receivePort = ReceivePort();
    receivePort.listen((message) {
      if (message is Map<String, dynamic> && message.containsKey('progress')) {
        _ref.read(backupTaskProvider.notifier).updateProgress(message['progress'], message['message']);
      }
    });

    try {
      final baseMediaDir = await _mediaStorage.getBaseDirectory();
      
      final sendPort = receivePort.sendPort;
      final result = await compute(_importFullArchiveInIsolate, _ImportFullArgs(
        zipFilePath,
        baseMediaDir,
        sendPort,
      ));
      
      _ref.read(backupTaskProvider.notifier).updateProgress(1.0, '註冊書庫資料...');
      
      if (result.libraryJson.isEmpty) {
        throw Exception('Invalid full archive file: library.json missing');
      }

      final comicsJson = jsonDecode(result.libraryJson) as List;
      final comics = comicsJson.map((json) => LocalComicEntity.fromJson(json)).toList();
      for (final comic in comics) {
        await _libraryManager.saveComic(comic);
      }

      if (result.tasksJson.isNotEmpty) {
        final tasksJsonData = jsonDecode(result.tasksJson) as List;
        final tasks = tasksJsonData.map((json) => ArchiveTask.fromJson(json)).toList();
        for (final task in tasks) {
          await _taskStorage.saveTask(task);
        }
        await _downloadService.reloadTasksFromStorage();
      }
      
      _ref.read(backupTaskProvider.notifier).finish('書庫匯入完成');
    } catch (e) {
      _ref.read(backupTaskProvider.notifier).fail(e.toString());
      rethrow;
    } finally {
      receivePort.close();
    }
  }
}

final archiveBackupServiceProvider = Provider<ArchiveBackupService>((ref) {
  final libraryManager = ref.watch(localLibraryManagerProvider);
  final mediaStorage = ref.watch(mediaStorageProvider);
  final taskStorage = ref.watch(archiveTaskStorageProvider);
  final downloadService = ref.watch(archiveDownloadServiceProvider);
  return ArchiveBackupService(libraryManager, mediaStorage, taskStorage, downloadService, ref);
});
